#' @title Available Engines
#'
#' @description Lists the engines available for a filtration
#'
#' @param filtration Character string specifying filter
#'
#' @include engine_metadata.R
#'
#' @return Character vector that has the available engines
#'
#' @export

available_engines <- function(filtration) {
  supported <- engine_metadata[
    engine_metadata$filtration == filtration,
  ]

  if (nrow(supported) == 0) {
    stop("No engine supports the requested filtration. Try
          available_filtrations() to see supported filtrations.")
  }
  return(supported$engine)
}
