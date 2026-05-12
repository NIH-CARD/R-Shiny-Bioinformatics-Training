library(shiny)
library(SummarizedExperiment)

source("../R/helpers.R")

# Load the data
simple_airway_se <- readRDS("../data/simple_airway_se.rds")
expression_matrix <- assay(simple_airway_se)

ui <- fluidPage(
  titlePanel("Reactive example"),
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
    textOutput("status_text"),
    conditionalPanel(
      condition = "input.view_type == 'table'",
      tableOutput("expression_table")
    ),
    conditionalPanel(
      condition = "input.view_type == 'heatmap'",
      plotOutput("expression_heatmap")
    )
  )
)

server <- function(input, output, session) {
  selected_genes <- reactive({
    expression_matrix[seq_len(input$genes_to_show), , drop = FALSE]
  })

  output$status_text <- renderText({
    paste("Showing", nrow(selected_genes()), "genes")
  })

  output$expression_table <- renderTable({
    selected_genes()
  }, rownames = TRUE)

  output$expression_heatmap <- renderPlot({
    plot_protein_zscore_heatmap(
      selected_genes(),
      main = paste("Top", nrow(selected_genes()), "genes")
    )
  })
}

shinyApp(ui = ui, server = server)
