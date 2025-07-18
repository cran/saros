% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/girafe.R
\name{girafe}
\alias{girafe}
\title{Pull global plotting settings before displaying plot}
\usage{
girafe(
  ggobj,
  ...,
  char_limit = 200,
  label_wrap_width = 80,
  interactive = TRUE,
  palette_codes = NULL,
  priority_palette_codes = NULL,
  ncol = NULL,
  byrow = TRUE,
  checked = NULL,
  not_checked = NULL,
  width_svg = NULL,
  height_svg = NULL,
  pointsize = 12
)
}
\arguments{
\item{ggobj}{ggplot2-object.}

\item{...}{Dots forwarded to \code{\link[ggiraph:girafe]{ggiraph::girafe()}}}

\item{char_limit}{Integer. Number of characters to fit on a line of plot (legend-space). Will be
replaced in the future with a function that guesses this.}

\item{label_wrap_width}{Integer. Number of characters fit on the axis text space before wrapping.}

\item{interactive}{Boolean. Whether to produce a ggiraph-plot with interactivity (defaults to TRUE)
or a static ggplot2-plot.}

\item{palette_codes}{Optional list of named character vectors with names being categories and values being colours. The final character vector of the list is taken as a final resort. Defaults to \code{NULL}.}

\item{priority_palette_codes}{Optional named character of categories (as names) with corresponding colours (as values) which are used first, whereupon the remaining unspecified categories are pulled from the last vector of \code{palette_codes}. Defaults to \code{NULL}.}

\item{ncol}{Optional integer or NULL.}

\item{byrow}{Whether to display legend keys by row or by column.}

\item{checked, not_checked}{Optional string. If specified and the fill categories of the plot matches these, a special plot is returned where not_checked is hidden. Its usefulness comes in plots which are intended for checkbox responses where unchecked is not always a conscious choice.}

\item{pointsize, height_svg, width_svg}{See \code{\link[ggiraph:girafe]{ggiraph::girafe()}}.}
}
\value{
If interactive, only side-effect of generating ggiraph-plot. If interactive=FALSE, returns modified ggobj.
}
\description{
This function extends \link[ggiraph:girafe]{ggiraph::girafe} by allowing colour palettes to be globally specified.
}
\examples{
plot <- makeme(data = ex_survey, dep = b_1)
girafe(plot)
}
