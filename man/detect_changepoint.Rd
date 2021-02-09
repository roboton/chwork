% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/detect_changepoint.R
\name{detect_changepoint}
\alias{detect_changepoint}
\title{Compute aggregate change point(s) on worker-level data}
\usage{
detect_changepoint(
  app_workers_data,
  app_id,
  num_cpts = 1,
  include_data = FALSE,
  include_model = FALSE
)
}
\arguments{
\item{app_workers_data}{contains time-series data for each worker over the
same period of time. Requires the following columns:
\itemize{
\item date: the date by which activity was recorded.
\item worker_id: a unique identifier for the worker.
\item count: number of units of activity for the corresponding date/worker.
}}

\item{app_id}{unique identifier for the application}

\item{num_cpts}{maximum number of change points to detect}

\item{include_data}{whether to include data in response}

\item{include_model}{whether to include change point model in response}
}
\description{
Aggregate app-level counts to detect significant change point(s) in counts.
}
\examples{
num_dates <- 90
num_workers <- 30
test_data <- merge(paste0("worker_", 1:num_workers),
      seq(Sys.Date(), Sys.Date() + (num_dates - 1), by = 1),
      colnames = c("foo", "bar"))
start_date <- Sys.Date() + floor(num_dates / 2)
test_data$count <- sapply(1:(num_dates*num_workers),
                          function(x) { rnorm(1, 50, 20) })
test_data <- setNames(test_data, c("worker_id", "date", "count"))
detect_changepoint(
  test_data, "test_analysis", include_data = FALSE, include_model = FALSE)
}