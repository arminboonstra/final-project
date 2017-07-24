

library(shiny)

ui <- fluidPage(
  titlePanel("Word Prediction!"),
  sidebarLayout(
    sidebarPanel(
      h4("Under the hood"),
      h4(" "),
      
      h5("Prediction from last 3 words"),
      verbatimTextOutput("L3w", placeholder = TRUE),
      verbatimTextOutput("L3p", placeholder = TRUE),
      verbatimTextOutput("L3l", placeholder = TRUE),
            
      h5("Prediction from last 2 words"),
      verbatimTextOutput("L2w", placeholder = TRUE),
      verbatimTextOutput("L2p", placeholder = TRUE),
      
      h5("Prediction from last word"),
      verbatimTextOutput("L1w", placeholder = TRUE),
      verbatimTextOutput("L1p", placeholder = TRUE),
      
      h5("Prediction from common words"),
      verbatimTextOutput("L0p", placeholder = TRUE)
      
    ),
    mainPanel(
      h3(textOutput("Word Prediction")),
      textInput("caption", "Write text below", "the end of"),
      
      h5("Next predicted word:"),
      verbatimTextOutput("final_pred", placeholder = TRUE)
      
    )
  )
)

