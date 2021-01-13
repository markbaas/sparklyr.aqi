package sparklyr.aqi

import org.apache.spark.sql.SparkSession;

object Main {
  def register(spark: SparkSession) = {
    spark.udf.register("con2lki", LKI.con2lki)
  }
}