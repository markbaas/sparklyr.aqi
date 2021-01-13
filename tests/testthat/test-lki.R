library(dplyr)
library(purrr)
library(readr)

test_that("Contaminants values match with expect lki.", {
    sc <- spark_connect(master = "local[*]")

    sparklyr_register_aqi(sc)

    data <- read_tsv("test-lki.csv") %>% copy_to(sc, .)

    results <- data %>% mutate(
        actual_lki = con2lki(con, val)
      ) %>%
      collect()

    pmap(
      list(results$con, results$val, results$actual_lki, results$expected_lki),
      function(con, val, actual, expected) {
        expect_equal(
          actual,
          expected,
          label = paste("Contaminant", con, "with value", val),
          expected.label = paste("expected lki of", expected))
      }
    )
})
