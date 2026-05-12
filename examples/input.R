library(shiny)
library(SummarizedExperiment)

# Load the data
simple_airway_se <- readRDS("../data/simple_airway_se.rds")

# Basic counts
n_samples <- ncol(simple_airway_se)
n_genes <- nrow(simple_airway_se)

ui <- fluidPage(
  titlePanel("Simple airway dataset summary"),
  mainPanel(
    selectInput(
      inputId = "view_type",
      label = "Choose a display type",
      choices = c("table", "heatmap")
    ),
    sliderInput(
      inputId = "genes_to_show",
      label = "How many genes should we show?",
      min = 10,
      max = 50,
      value = 20
    ),
    checkboxInput(
      inputId = "good_day",
      label = "Are you having a good day?",
      value = TRUE
    ),
    fileInput(
      inputId = "expression_file",
      label = "Upload a gene expression file"
    ),
    h3("Dataset summary"),
    verbatimTextOutput("summary_text")
  )
)

server <- function(input, output, session) {
  output$summary_text <- renderText({
    paste(
      "Number of samples:", n_samples,
      "\nNumber of genes:", n_genes
    )
  })
}

shinyApp(ui = ui, server = server)
