/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// scalastyle:off println
package org.apache.spark.examples

import scala.math.random

import mpi.{MPI, MPIException}

import org.apache.spark.SparkConf
import org.apache.spark.blaze.BlazeSession

/** Computes an approximation to pi */
object SparkPi2 {

  @throws[MPIException]
  private def mpiop(mpargs: Array[String]): Unit = {


    MPI.Init(mpargs)
    val myrank = MPI.COMM_WORLD.getRank
    val size = MPI.COMM_WORLD.getSize
    System.out.println("Hello world from rank " + myrank + " size of " + size)
    MPI.Finalize()
  }

  def main(args: Array[String]): Unit = {

    val conf = new SparkConf().set("spark.master", "spark://192.168.32.197:7077");

//    val spark = SparkSession
//      .builder
//      .config(conf)
//      .appName("Spark Pi")
//      .getOrCreate()


    val blaze = BlazeSession
      .builder
      .appName("blazePi")
      .config(conf)
//      .master("local[2]")
//      .master("spark://192.168.32.197:7077")
      .getOrCreate()


    val start = System.nanoTime()
//    val slices = if (args.length > 0) args(0).toInt else 2
    val slices = 8
    val n = math.min(100000L * slices, Int.MaxValue).toInt // avoid overflow
    val count = blaze.sparkContext.parallelize(1 until n, slices).map { i =>
      val x = random * 2 - 1
      val y = random * 2 - 1
      if (x*x + y*y <= 1) 1 else 0
    }.reduce(_ + _)

//    blaze.sparkContext.parallelize(1 until 3, slices).map(i => mpiop(args)).collect()
//    blaze.mpiContext.parallelize(1 until 2, slices).map(i => mpiop(args)).collect()
//    mpiop(args);
    val end = System.nanoTime()
    println(s"Pi is roughly ${4.0 * count / (n - 1)}")
    println(s"elapse time is ${(end - start) / 1000000} ms")
    blaze.stop()
  }
}
// scalastyle:on println
