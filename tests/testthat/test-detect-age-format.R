testthat::test_that("female and male age formats are detected", {
  female <- data.frame(V17 = c("19770119", "19800617"))
  male <- data.frame(V17 = c("22.5", "25.75"))

  testthat::expect_equal(detect_age_format(female), "dob")
  testthat::expect_equal(detect_age_format(male), "age")
})

testthat::test_that("missing values are handled", {
  female <- data.frame(V17 = c("19770119", NA, ""))
  male <- data.frame(V17 = c("22.5", NA, ""))

  testthat::expect_equal(detect_age_format(female), "dob")
  testthat::expect_equal(detect_age_format(male), "age")
})

testthat::test_that("invalid formats produce errors", {
  invalid <- data.frame(V17 = c("unknown", "invalid"))
  empty <- data.frame(V17 = c(NA_character_, ""))

  testthat::expect_error(detect_age_format(invalid))
  testthat::expect_error(detect_age_format(empty))
})
