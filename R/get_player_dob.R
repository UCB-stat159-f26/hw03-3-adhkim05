get_player_dob <- function(player_name) {
  name <- normalize_player_name(player_name)

  for (prefix in c("player", "wplayer")) {
    url <- paste0("https://www.tennisabstract.com/cgi-bin/",
                  prefix, ".cgi?p=", name)

    for (attempt in 1:3) {
      html <- tryCatch(
        paste(readLines(url, warn = FALSE), collapse = "\n"),
        error = function(e) ""
      )
      match <- regmatches(html, regexpr("var dob\\s*=\\s*[0-9]{8}", html))
      if (length(match) > 0 && nzchar(match)) {
        return(as.Date(sub(".*=\\s*", "", match), format = "%Y%m%d"))
      }
      Sys.sleep(1)
    }
  }

  stop("Could not retrieve player's date of birth.", call. = FALSE)
}
