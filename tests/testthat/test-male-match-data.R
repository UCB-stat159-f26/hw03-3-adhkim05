testthat::test_that("male match data is cleaned correctly", {
  js <- paste(readLines("fixtures/male_matches.js"), collapse = "\n")
  matches <- parse_match_data(js)
  cleaned <- clean_match_data(matches, as.Date("1986-06-03"), "age")

  testthat::expect_equal(nrow(cleaned), 2)
  testthat::expect_s3_class(cleaned$match_date, "Date")
  testthat::expect_equal(cleaned$result, c("W", "L"))
  testthat::expect_equal(cleaned$opponent_age, c(22.5, 25.75))
  testthat::expect_equal(
    cleaned$age_difference,
    cleaned$player_age - cleaned$opponent_age
  )
})
