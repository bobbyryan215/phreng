spec <- PersistenceRaster(
  filtration = "cubical",
  engine = "ripserr",
  max_dimension = 1,
  max_scale = 2,
  sublevel = TRUE
)

# constructor test
expect_inherits(spec, "phreng::PersistenceRaster")
expect_inherits(spec, "phreng::Persistence")
expect_equal(spec@filtration, "cubical")
expect_equal(spec@engine, "ripserr")
expect_equal(spec@max_dimension, 1)
expect_equal(spec@max_scale, 2)
expect_equal(spec@sublevel, TRUE)

# default argument test
spec <- PersistenceRaster()

expect_inherits(spec, "phreng::PersistenceRaster")
expect_equal(spec@engine, "TDA")
expect_true(is.na(spec@library))
expect_equal(spec@max_dimension, 1)
expect_equal(spec@filtration, "cubical")
expect_true(is.na(spec@max_scale))
expect_equal(spec@sublevel, TRUE)

# sublevel value tests
spec <- PersistenceRaster(sublevel = TRUE)
expect_equal(spec@sublevel, TRUE)

spec <- PersistenceRaster(sublevel = FALSE)
expect_equal(spec@sublevel, FALSE)

# max_scale test
spec <- PersistenceRaster(max_scale = 10)

expect_equal(spec@max_scale, 10)

# max_scale boundary test
spec <- PersistenceRaster(max_scale = 0)

expect_equal(spec@max_scale, 0)

# validator tests
expect_error(
  PersistenceRaster(engine = "bad_engine"),
  "TDA"
)
expect_error(
  PersistenceRaster(engine = "bad_engine"),
  "ripserr"
)
expect_error(
  PersistenceRaster(library = "bad_engine"),
  "GUDHI"
)
expect_error(
  PersistenceRaster(filtration = "bad_filtration"),
  "must be vietoris_rips, cubical, alpha_shape, or alpha_complex"
)
expect_error(
  PersistenceRaster(max_dimension = -1),
  "non-negative"
)
expect_error(
  PersistenceRaster(max_dimension = 1.5),
  "integer"
)
expect_error(
  PersistenceRaster(engine = "ripserr", library = "GUDHI"),
  "TDA"
)
expect_error(
  PersistenceRaster(filtration = "vietoris_rips", engine = "ripserr"),
  "cubical"
)
expect_error(
  PersistenceRaster(sublevel = NA),
  "TRUE or FALSE"
)

expect_error(
  PersistenceRaster(sublevel = "TRUE"),
  "sublevel"
)

expect_error(
  PersistenceRaster(sublevel = 1),
  "sublevel"
)

# data type test
expect_error(
  compute_persistence(spec, as.double(1:5)),
  "matrix"
)
expect_error(
  compute_persistence(spec, as.double(1:5)),
  "array"
)

# compute test
exit_if_not(
  requireNamespace("ripserr", quietly = TRUE),
  requireNamespace("phutil", quietly = TRUE)
)
data <- volcano
spec <- PersistenceRaster(
  filtration = "cubical",
  engine = "ripserr",
  max_dimension = 1,
  max_scale = 300,
  sublevel = TRUE
)
out <- compute_persistence(spec, data)
expect_inherits(out, "persistence")
