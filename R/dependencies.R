
spark_dependencies <- function(spark_version, scala_version, ...) {
  sparklyr::spark_dependency(
    jars = c(
      system.file(
        sprintf("java/sparklyr.aqi-%s-%s.jar", spark_version, scala_version),
        package = "sparklyr.aqi"
      )
    ),
    packages = c()
  )
}

#' @import sparklyr
.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}