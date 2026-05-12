library(shiny)

ui <- fluidPage(
  titlePanel("req() example"),
  mainPanel(
    fileInput(
      inputId = "expression_file",
      label = "Upload a gene expression file"
    ),
    h3("Uploaded file path"),
    textOutput("file_path")
  )
)

server <- function(input, output, session) {
  output$file_path <- renderText({
    req(input$expression_file)
    input$expression_file$datapath
  })
}

shinyApp(ui = ui, server = server)
