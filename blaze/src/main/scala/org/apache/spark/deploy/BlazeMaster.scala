
package org.apache.spark.deploy.master

import org.apache.spark.blaze.deploy.mpi.{MPILauncher, NativeUtils}
import org.apache.spark.deploy.master.MasterMessages.{BoundPortsRequest, BoundPortsResponse}
import org.apache.spark.{SecurityManager, SparkConf}
import org.apache.spark.deploy.master._
import org.apache.spark.internal.Logging
import org.apache.spark.rpc.{RpcAddress, RpcEnv}
import org.apache.spark.util.{SparkUncaughtExceptionHandler, Utils}

import scala.collection.mutable.ArrayBuffer
import scala.io.Source
import scala.sys.exit
import scala.util.control.Breaks.{break, breakable}

class BlazeMaster(override val rpcEnv: RpcEnv,
                  address: RpcAddress,
                  webUiPort: Int,
                  override val securityMgr: SecurityManager,
                  override val conf: SparkConf
                 ) extends Master(rpcEnv, address, webUiPort, securityMgr, conf) {
}

private[deploy] object BlazeMaster extends Logging {
  val SYSTEM_NAME = "sparkMaster"
  val ENDPOINT_NAME = "Master"


  def main(argStrings: Array[String]): Unit = {
    Thread.setDefaultUncaughtExceptionHandler(new SparkUncaughtExceptionHandler(
      exitOnUncaughtException = false))
    Utils.initDaemon(log)
    val conf = new SparkConf

    conf.set("spark.local.ip", "192.168.32.197")
//      .set("spark.master.host", "192.168.32.197")
    val args = new MasterArguments(argStrings, conf)
    val (rpcEnv, _, _) = startRpcEnvAndEndpoint(args.host, args.port, args.webUiPort, conf)
    startMPIRuntimeEnv()
    rpcEnv.awaitTermination()
  }

  def startMPIRuntimeEnv(): Thread = {
    val mpiSrvThread = new Thread {
      override def run: Unit = {
        launchMPIRuntimeEnv()
      }
    }
    mpiSrvThread.start()
    mpiSrvThread
  }

  /**
   * Start MPIRuntimeEnv base on PMIx library
   *
   */
  def launchMPIRuntimeEnv(): Unit = {
    // TODO: worker register to Master with SparkEnv, and add receiveAndReply case in Master

    /* load native lib avoid undefined symbol in odls */
    val strings: Array[String] = new Array[String](1)
    strings(0) = "/home/xialb/lib/libblaze.so"
    NativeUtils.loadLibrary(strings)

    val hosts = getWorkersHost()
    if (0 == MPILauncher.launch(hosts)) {
      logInfo("Start MPIRuntimeEnv successful")
    } else {
      logError("Start MPIRuntimeEnv failed!")
      exit(0)
    }
  }

  def getWorkersHost(): Array[String] = {
    val slave = "/home/xialb/opt/spark/conf/slaves"
    val hosts = ArrayBuffer[String]("prte")
    hosts += "-H"
    val cores = getCores()
    for (host <- Source.fromFile(slave).getLines()) {
      breakable {
        if (host.matches("^[a-zA-Z].*$")) {
          logInfo(s"Start MPIEnv in host ${host}")
          hosts += (host + ":" + cores)
        } else {
          break()
        }
      }
    }
    hosts.toArray
  }

  def getCores(): Int = {
    Runtime.getRuntime().availableProcessors();
  }

  /**
   * Start the Master and return a three tuple of:
   * (1) The Master RpcEnv
   * (2) The web UI bound port
   * (3) The REST server bound port, if any
   */
  def startRpcEnvAndEndpoint(
                              host: String,
                              port: Int,
                              webUiPort: Int,
                              conf: SparkConf): (RpcEnv, Int, Option[Int]) = {
    val securityMgr = new SecurityManager(conf)
    val rpcEnv = RpcEnv.create(SYSTEM_NAME, host, port, conf, securityMgr)
    val masterEndpoint = rpcEnv.setupEndpoint(ENDPOINT_NAME,
      new Master(rpcEnv, rpcEnv.address, webUiPort, securityMgr, conf))
    val portsResponse = masterEndpoint.askSync[BoundPortsResponse](BoundPortsRequest)
    (rpcEnv, portsResponse.webUIPort, portsResponse.restPort)
  }
}
