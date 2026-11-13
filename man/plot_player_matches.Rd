\name{plot_player_matches}
\alias{plot_player_matches}
\title{Plot tennis player career matches}
\usage{
plot_player_matches(data)
}
\arguments{
\item{data}{A cleaned data frame from get_player_data().}
}
\description{
Creates a scatter plot of player age against the age
difference between the player and opponent, with points
colored by match result.
}
\value{
A ggplot object.
}
