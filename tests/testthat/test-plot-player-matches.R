testthat::test_that("plot_player_matches returns a ggplot", {
  matches <- data.frame(
    match_date = as.Date(c("2022-08-29", "2022-08-31")),
    opponent = c("Test Opponent", "Another Opponent"),
    result = c("W", "L"),
    player_age = c(40.9, 40.9),
    opponent_age = c(32.5, 37.6),
    age_difference = c(8.4, 3.3)
  )

  p <- plot_player_matches(matches)

  testthat::expect_s3_class(p, "ggplot")
  testthat::expect_equal(nrow(p$data), 2)
  testthat::expect_equal(p$data$result, c("W", "L"))
})
