# Reusable helper functions for plotting and data wrangling.

plot_protein_zscore_heatmap <- function(data,
                                        protein_names = NULL,
                                        sample_names = NULL,
                                        n_proteins = NULL,
                                        main = "Protein heatmap (row z-scores)",
                                        ...) {
  matrix_data <- as.matrix(data)

  if (!is.numeric(matrix_data)) {
    stop("`data` must be coercible to a numeric matrix.")
  }

  if (nrow(matrix_data) < 1 || ncol(matrix_data) < 1) {
    stop("`data` must have at least one row and one column.")
  }

  if (!is.null(protein_names)) {
    if (length(protein_names) != nrow(matrix_data)) {
      stop("`protein_names` must have one entry per row in `data`.")
    }
    rownames(matrix_data) <- protein_names
  }

  if (!is.null(sample_names)) {
    if (length(sample_names) != ncol(matrix_data)) {
      stop("`sample_names` must have one entry per column in `data`.")
    }
    colnames(matrix_data) <- sample_names
  }

  if (!is.null(n_proteins)) {
    if (length(n_proteins) != 1 || !is.numeric(n_proteins) || is.na(n_proteins)) {
      stop("`n_proteins` must be a single numeric value.")
    }

    n_proteins <- as.integer(n_proteins)

    if (n_proteins < 1) {
      stop("`n_proteins` must be at least 1.")
    }

    matrix_data <- matrix_data[seq_len(min(n_proteins, nrow(matrix_data))), , drop = FALSE]
  }

  row_means <- rowMeans(matrix_data, na.rm = TRUE)
  row_sds <- apply(matrix_data, 1, stats::sd, na.rm = TRUE)

  z_matrix <- sweep(matrix_data, 1, row_means, FUN = "-")
  nonzero_sd <- row_sds > 0 & !is.na(row_sds)
  z_matrix[nonzero_sd, ] <- sweep(z_matrix[nonzero_sd, , drop = FALSE], 1, row_sds[nonzero_sd], FUN = "/")
  z_matrix[!nonzero_sd, ] <- 0

  stats::heatmap(
    z_matrix,
    scale = "none",
    Rowv = NA,
    Colv = NA,
    col = grDevices::colorRampPalette(c("navy", "white", "firebrick3"))(100),
    margins = c(6, 8),
    main = main,
    ...
  )
}
