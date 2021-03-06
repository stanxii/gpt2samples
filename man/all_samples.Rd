% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all_samples.R
\name{all_samples}
\alias{all_samples}
\title{Tidy data frame of Open AI GPT-2 sample_texts}
\usage{
all_samples()
}
\description{
Returns a tidy data frame of all conditional and unconditional generated texts.
}
\examples{

library(dplyr)

all_samples() \%>\%
 group_by(file) \%>\%
 summarise(total_lines = n())

}
