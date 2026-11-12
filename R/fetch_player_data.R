fetch_player_data <- function(player_name) {
  name <- normalize_player_name(player_name)
  url <- paste0(
    "https://www.tennisabstract.com/jsmatches/",
    name, "Career.js"
  )

  response <- tryCatch(
    readLines(url, warn = FALSE),
    error = function(e) {
      stop(paste("Could not retrieve data for", player_name),
           call. = FALSE)
    }
  )

  paste(response, collapse = "\n")
}
