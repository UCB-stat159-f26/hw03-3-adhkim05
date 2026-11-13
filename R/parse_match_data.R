parse_match_data <- function(js_text) {
  if (!is.character(js_text) || length(js_text) != 1 ||
      is.na(js_text) || !grepl("morematchmx", js_text, fixed = TRUE)) {
    stop("Invalid Tennis Abstract match data.", call. = FALSE)
  }

  json_text <- sub("^\\s*var\\s+morematchmx\\s*=\\s*", "", js_text)
  json_text <- sub(";\\s*$", "", json_text)

  matches <- tryCatch(
    jsonlite::fromJSON(json_text, simplifyVector = FALSE),
    error = function(e) stop("Could not parse match data.", call. = FALSE)
  )

  width <- max(lengths(matches))
  rows <- lapply(matches, function(row) {
    length(row) <- width
    unlist(lapply(row, function(x) if (is.null(x)) NA_character_ else x))
  })

  as.data.frame(do.call(rbind, rows), stringsAsFactors = FALSE)
}