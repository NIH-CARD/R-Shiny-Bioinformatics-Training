# Shiny Workshop: Exploring Biological Data with R

This repository contains materials for a short course on building interactive web applications using **Shiny in R**. The goal of this workshop is to introduce the core concepts of Shiny and demonstrate how it can be used to explore biological datasets.

---

## Data

This workshop uses a simplified version of the **`airway` RNA-seq dataset**, a publicly available dataset from Bioconductor.

- The dataset contains gene expression measurements from **human airway smooth muscle cells**
- Samples include both **treated (dexamethasone)** and **untreated conditions**
- The original dataset has thousands of genes; for this workshop, it has been reduced to the **500 most variable genes** to make exploration faster and more intuitive

The data is stored as a **`SummarizedExperiment` object**, a common Bioconductor data structure that keeps:
- expression data (counts)
- sample metadata (e.g., treatment group)
- gene metadata (e.g., gene identifiers)

File location:data/simple_airway_se.rds


---

## Shiny App

The app in this repository is a **minimal example** designed to illustrate the basic structure of a Shiny application.

#### What the app shows
- The **number of samples** in the dataset
- The **number of genes** in the dataset

#### Key Shiny concepts demonstrated
- **User Interface (UI)**: what the user sees
- **Server logic**: how R processes and returns results
- **Outputs**: displaying results in the app

#### Run the app
Open `app.R` in RStudio and click **Run App**, or run:
```
shiny::runApp()
```

---

## Getting Started (Download the Repository)
To use these materials, you can download the repository:
git clone https://github.com/NIH-CARD/R-Shiny-Bioinformatics-Training.git