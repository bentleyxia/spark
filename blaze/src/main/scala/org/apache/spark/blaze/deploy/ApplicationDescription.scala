
package org.apache.spark.blaze.deploy

import java.net.URI

import org.apache.spark.deploy.Command
import org.apache.spark.resource.ResourceRequirement

private[spark] case class ApplicationDescription(
                                                  name: String,
                                                  maxCores: Option[Int],
                                                  memoryPerExecutorMB: Int,
                                                  command: Command,
                                                  appUiUrl: String,
                                                  eventLogDir: Option[URI] = None,
                                                  // short name of compression codec used when writing event logs, if any (e.g. lzf)
                                                  eventLogCodec: Option[String] = None,
                                                  coresPerExecutor: Option[Int] = None,
                                                  // number of executors this application wants to start with,
                                                  // only used if dynamic allocation is enabled
                                                  initialExecutorLimit: Option[Int] = None,
                                                  user: String = System.getProperty("user.name", "<unknown>"),
                                                  resourceReqsPerExecutor: Seq[ResourceRequirement] = Seq.empty) {

  override def toString: String = "ApplicationDescription(" + name + ")"
}
