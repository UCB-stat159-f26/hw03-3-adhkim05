testthat::test_that("invalid JS input is rejected", {
  testthat::expect_error(parse_match_data(""))
  testthat::expect_error(parse_match_data("invalid data"))
  testthat::expect_error(parse_match_data(NA_character_))
})

testthat::test_that("invalid opponent age format is rejected", {
  testthat::expect_error(
    get_opponent_age(as.Date("2022-08-29"), "22.5", "invalid")
  )
})

testthat::test_that("missing opponent age is handled", {
  age <- get_opponent_age(as.Date("2022-08-29"), "", "age")
  testthat::expect_true(is.na(age))
})

testthat::test_that("age calculations are consistent", {
  dob <- as.Date("2000-01-01")
  match_date <- as.Date("2020-01-01")

  testthat::expect_equal(
    calculate_age(match_date, dob),
    as.numeric(match_date - dob) / 365.25
  )
})
