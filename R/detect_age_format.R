detect_age_format <- function(matches) {
  values <- as.character(matches$V17)
  values <- values[!is.na(values) & nzchar(values)]

  if (length(values) == 0) {
    stop("No opponent age information available.", call. = FALSE)
  }

  if (all(grepl("^[0-9]{8}$", values))) {
    return("dob")
  }

  if (all(grepl("^[0-9]+(\\.[0-9]+)?$", values))) {
    return("age")
  }

  stop("Unrecognized opponent age format.", call. = FALSE)
}
