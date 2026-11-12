normalize_player_name <- function(player_name) {
  if (!is.character(player_name) || length(player_name) != 1 ||
      is.na(player_name) || !nzchar(trimws(player_name))) {
    stop("Please provide a valid player name.")
  }

  words <- strsplit(trimws(player_name), "\\s+")[[1]]
  if (length(words) == 1) {
    return(paste0(toupper(substr(words, 1, 1)),
                  substr(words, 2, nchar(words))))
  }

  paste0(vapply(words, function(word) {
    paste0(toupper(substr(word, 1, 1)),
           tolower(substr(word, 2, nchar(word))))
  }, character(1)), collapse = "")
}
