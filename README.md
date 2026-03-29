# Shiny Workshop Starter App

This repository contains a very simple Shiny app for the workshop.

## Data

The app expects a file at:

`data/simple_airway_se.rds`

This file should contain a `SummarizedExperiment` object named `simple_airway_se`.

## Run the app

Open `app.R` in RStudio and click **Run App**, or run:

```r
shiny::runApp()