library(shiny)
library(SummarizedExperiment)


# Load the data
simple_airway_se <- readRDS("data/simple_airway_se.rds")

# Basic counts
n_samples <- ncol(simple_airway_se)
n_genes <- nrow(simple_airway_se)

ui <- fluidPage(
  titlePanel("Simple airway dataset summary"),
  mainPanel(
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