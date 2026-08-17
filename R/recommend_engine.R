#' @title Recommend an Engine
#'
#' @description Recommends an engine based on filtration
#'
#' @param filtration Character string specifying filter
#'
#' @include engine_metadata.R
#'
#' @return Character string that has the recommended engine
#'
#' @noRd

recommend_engine <- function(filtration) {

  supported <- engine_metadata[engine_metadata[[filtration]] == "TRUE", ]

  if (nrow(supported) == 0) {
    stop("No engine supports the requested filtration. Try available_filtrations() to see supported filtrations.")
  }

  return(supported$engine)
}


recommend_engine("cubical")


