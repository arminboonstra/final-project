## Only run examples in interactive R sessions
if (interactive()) {
  
  ui <- fluidPage(
    textInput("caption", "Caption", "Data Summary"),
    verbatimTextOutput("value")
  )
  server <- function(input, output) {
    output$value <- renderText({ input$caption })
  }
  shinyApp(ui, server)
}