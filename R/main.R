#' @import sparklyr
#' @export
sparklyr_register_aqi <- function(sc) {
    sparklyr::invoke_static(
        sc, "sparklyr.aqi.Main", "register", spark_session(sc))
}