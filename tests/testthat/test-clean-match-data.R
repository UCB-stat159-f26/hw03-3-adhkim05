testthat::test_that("female match data is cleaned correctly", {
  js <- paste(readLines("fixtures/sample_matches.js"),
              collapse = "\n")
  matches <- parse_match_data(js)
  cleaned <- clean_match_data(matches, as.Date("1981-09-26"), "dob")

  testthat::expect_equal(nrow(cleaned), 2)
  testthat::expect_s3_class(cleaned$match_date, "Date")
  testthat::expect_equal(cleaned$result, c("W", "L"))
  testthat::expect_equal(cleaned$opponent,
                         c("Test Opponent", "Another Opponent"))
  testthat::expect_equal(
    cleaned$age_difference,
    cleaned$player_age - cleaned$opponent_age
  )
})
