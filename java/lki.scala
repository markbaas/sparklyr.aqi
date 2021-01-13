package sparklyr.aqi

import scala.collection.mutable.HashMap

object LKI {
//   def con2lki(con: String, value: Double) : String = {
//     "Hello, world! - From Scala"
//   }

  val steps = HashMap(
    "NO2" -> List(0, 10, 20, 30, 45, 60, 75, 100, 125, 150, 200),
    "PM25" -> List(0, 10, 15, 20, 30, 40, 50, 70, 90, 100, 140),
    "PM10" -> List(0, 10, 20, 30, 45, 60, 75, 100, 125, 150, 200),
    "O3" -> List(0, 15, 30, 40, 60, 80, 100, 140, 180, 200, 240)
  )

  val con2lki = (_con: String, value: Double) => {
    val con = _con.toUpperCase()
    val l = steps(con)
    val lower_val = l.fold(0){ (x, y) => if (value >= y) y else x }
    val i = l.indexOf(lower_val) + 1

    i
  }
}
