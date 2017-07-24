

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
      #verbatimTextOutput("L3l", placeholder = TRUE),
            
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
      h4("Please input a text below:"),
      textInput("caption", "", "Last night i"),
      
      HTML("<br>"),
      
      h4("The predicted next word for the sentence is:"),
      verbatimTextOutput("final_pred", placeholder = TRUE),
      
      HTML("<br><br>"),
      h4("About"),
      helpText('This app predicts the next word of a sentence, that a user inputs into the above textbox. 
               The app works by predicting either based on the last 3 words of the sentence, the last two words of the sentence, the last word of the sentence. 
               If nothing is found the most common word "the" is chosen.
               The panel on the left shows the individual words that are predicted in the above manner. ')
    )
  )
)

