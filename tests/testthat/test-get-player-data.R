testthat::test_that("get_player_data works with offline fixtures", {
  testthat::local_mocked_bindings(
    fetch_player_data = function(player_name) {
      file <- if (normalize_player_name(player_name) == "SerenaWilliams") {
        "sample_matches.js"
      } else {
        "male_matches.js"
      }
      paste(readLines(testthat::test_path("fixtures", file)), collapse = "\n")
    },
    get_player_dob = function(player_name) {
      if (normalize_player_name(player_name) == "SerenaWilliams") {
        as.Date("1981-09-26")
      } else {
        as.Date("1986-06-03")
      }
    }
  )

  for (name in c("Serena Williams", "Rafael Nadal")) {
    result <- get_player_data(name)

    testthat::expect_s3_class(result, "data.frame")
    testthat::expect_equal(nrow(result), 2)
    testthat::expect_true(all(c(
      "match_date", "opponent", "result",
      "player_age", "opponent_age", "age_difference"
    ) %in% names(result)))
  }
})
