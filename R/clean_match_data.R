clean_match_data <- function(matches, player_dob, format) {
  match_date <- as.Date(matches$V1, format = "%Y%m%d")
  player_age <- calculate_age(match_date, player_dob)
  opponent_age <- get_opponent_age(match_date, matches$V17, format)

  data.frame(
    match_date = match_date,
    opponent = matches$V12,
    result = matches$V5,
    player_age = player_age,
    opponent_age = opponent_age,
    age_difference = player_age - opponent_age
  )
}
