#' Get a tennis player's career match data
#'
#' @param player_name Name of the tennis player.
#' @return A data frame of cleaned career matches.
#' @export
get_player_data <- function(player_name) {
  js <- fetch_player_data(player_name)
  matches <- parse_match_data(js)
  dob <- get_player_dob(player_name)

  name <- normalize_player_name(player_name)
  format <- if (name %in% c("SerenaWilliams", "VenusWilliams")) {
    "dob"
  } else {
    "age"
  }

  clean_match_data(matches, dob, format)
}
