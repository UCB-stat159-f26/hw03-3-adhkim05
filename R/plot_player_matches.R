#' Plot a player's career match age differences
#'
#' @param data Cleaned match data from get_player_data().
#' @return A ggplot scatterplot.
#' @export
plot_player_matches <- function(data) {
  required <- c("player_age", "age_difference", "result")
  if (!all(required %in% names(data))) {
    stop("Missing required columns.", call. = FALSE)
  }

  ggplot2::ggplot(
    data,
    ggplot2::aes(x = .data[["player_age"]], y = .data[["age_difference"]], color = .data[["result"]])
  ) +
    ggplot2::geom_hline(
  yintercept = 0,
  color = "gray50",
  linewidth = 0.4
) +ggplot2::geom_point(alpha = 0.6) +
    ggplot2::scale_color_manual(
      values = c("W" = "#4acbed", "L" = "#953a8c"),
      labels = c("W" = "Win", "L" = "Loss")
    ) +
    ggplot2::labs(
      title = "Career Matches by Age Difference",
      x = "Player Age (Years)",
      y = "Player Age - Opponent Age (Years)",
      color = "Result"
    ) +
    ggplot2::theme_minimal()
}
