ui <- fluidPage(
  mainPanel(
    verbatimTextOutput("welcome_msg")
  )
)

server <- function(input, output, session) {
  output$welcome_msg <- renderText({
    paste("Hello world")
  })
}

shinyApp(ui = ui, server = server)
