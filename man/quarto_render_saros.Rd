% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render.R
\name{quarto_render_saros}
\alias{quarto_render_saros}
\title{Simple wrapper for quarto::quarto_render() that temporarily sets LC_ALL="C" and takes the processing time}
\usage{
quarto_render_saros(site_path, ...)
}
\arguments{
\item{site_path}{String, path to render.}

\item{...}{Dynamic dots forwarded to quarto::quarto_render}
}
\value{
Nothing
}
\description{
Simple wrapper for quarto::quarto_render() that temporarily sets LC_ALL="C" and takes the processing time
}
