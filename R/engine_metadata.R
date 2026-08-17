#' @title Engine Metadata
#'
#' @description This function stores the metadata of each filtration
#'
#' @noRd

engine_metadata <- data.frame(
  engine = c("ripserr", "TDA", "input"),
  alpha_complex = c(FALSE, TRUE, "point cloud"),
  alpha_shape = c(FALSE, TRUE, "3D point cloud"),
  cubical = c(TRUE, FALSE, "numeric array"),
  cubical_array = c(TRUE, FALSE, "numeric array"),
  distance_matrix = c(TRUE, TRUE, "numeric distance matrix"),
  point_cloud = c(TRUE, TRUE, "numeric matrix"),
  time_series = c(TRUE, FALSE, "numeric vector or time series"),
  vietoris_rips = c(TRUE, TRUE, "point cloud or numeric distance matrix"),
  stringsAsFactors = FALSE
)

