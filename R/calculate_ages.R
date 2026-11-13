calculate_age <- function(match_date, birth_date) {
  as.numeric(as.Date(match_date) - as.Date(birth_date)) / 365.25
}

get_opponent_age <- function(match_date, value, format) {
  if (format == "dob") {
    birth_date <- as.Date(as.character(value), format = "%Y%m%d")
    return(calculate_age(match_date, birth_date))
  }

  if (format == "age") {
    return(suppressWarnings(as.numeric(value)))
  }

  stop("Invalid opponent age format.", call. = FALSE)
}
