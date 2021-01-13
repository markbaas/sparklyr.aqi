library(sparklyr)

spec <- sparklyr::spark_default_compilation_spec()
spec <- Filter(function(e) e$spark_version >= "2.4.0", spec)

compile_package_jars(spec = spec)