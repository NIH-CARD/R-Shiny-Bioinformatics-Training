cran_packages <- c(
  "BiocManager",
  "shiny"
)

bioc_packages <- c(
  "SummarizedExperiment",
  "airway",
  "matrixStats"
)

install_if_missing <- function(packages, installer) {
  missing_packages <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]

  if (length(missing_packages) > 0) {
    installer(missing_packages)
  }
}

install_if_missing(
  cran_packages,
  function(packages) install.packages(packages, repos = "https://cloud.r-project.org")
)

install_if_missing(
  "BiocManager",
  function(packages) install.packages(packages, repos = "https://cloud.r-project.org")
)

install_if_missing(
  bioc_packages,
  function(packages) BiocManager::install(packages, ask = FALSE, update = FALSE)
)

message("Package installation check complete.")
