
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sparklyr.aqi

<!-- badges: start -->

<!-- badges: end -->

The goal of sparklyr.aqi is to calculate air quality indexes world wine.

## Installation

You can install the released version of sparklyr.aqi from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("sparklyr.aqi")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("markbaas/sparklyr.aqi")
```

## Status

Currently this following indexes are implement

  - LKI (Netherlands)

## Example

This is a basic example which calculate the dutch LKI.

``` r
library(dplyr, warn.conflicts = F, quietly = T)
library(sparklyr)
library(sparklyr.aqi)

sc <- spark_connect("local[*]")

sparklyr_register_aqi(sc)
#> <jobj[14]>
#>   org.apache.spark.sql.expressions.SparkUserDefinedFunction
#>   SparkUserDefinedFunction(sparklyr.aqi.LKI$$$Lambda$1052/1783519195@68bcd545,IntegerType,List(Some(class[value[0]: string]), Some(class[value[0]: double])),Some(con2lki),false,true)

data <- data.frame(
  formula = c("pm25", "pm10", "no2", "o3"),
  value = c(101, 10, 120, 90)
)

data %>%
  copy_to(sc, .) %>%
  mutate(
    lki = con2lki(formula, value)
  )
#> # Source: spark<?> [?? x 3]
#>   formula value   lki
#>   <chr>   <dbl> <int>
#> 1 pm25      101    10
#> 2 pm10       10     2
#> 3 no2       120     8
#> 4 o3         90     6
```
