#' @title Available Filtrations
#'
#' @description Lists all filtrations supported by each engine
#'
#' @return Dataframe with one row per filtration and a column with supported
#' engines
#'
#' @export

available_filtrations <- function() {

  df <- engine_metadata

  rownames(df) <- df$engine
  df$engine <- NULL

  df <- as.data.frame(t(df))

  df[, c("ripserr", "TDA")] <-
    lapply(df[, c("ripserr", "TDA")],
           function(x) ifelse(x == "TRUE", "Yes", "No"))

  df
}

available_filtrations()
