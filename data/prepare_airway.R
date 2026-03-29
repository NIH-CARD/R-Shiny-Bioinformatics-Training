# Optional data-prep script for instructors.
# The workshop app reads directly from the airway package, so this script is only
# needed if you want to cache a local copy of the expression matrix and metadata.

library(airway)
library(SummarizedExperiment)
library(matrixStats)

data(airway)
saveRDS(airway, "data/airway.rds")

vars <- rowVars(assay(airway))
top_idx <- order(vars, decreasing = TRUE)[1:500]

airway_500 <- airway[top_idx, ]

simple_airway <- SummarizedExperiment(
  list(counts = assay(airway_500)),
  rowData = rowData(airway_500),
  colData = colData(airway_500),
  metadata = metadata(airway_500)
)

saveRDS(simple_airway, file = "data/simple_airway_se.rds")
