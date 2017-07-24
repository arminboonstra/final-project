
library(shiny)
library(stringi)

setwd('H:/Documents/R/capstone/app/Word_Prediction')

d <- read.csv('H:/Documents/R/capstone/app/Word_Prediction/d.csv', colClasses = c("character", "character","character"))
d2 <- read.csv('H:/Documents/R/capstone/app/Word_Prediction/d2.csv', colClasses = c("character", "character", "character","character"))
d3 <- read.csv('H:/Documents/R/capstone/app/Word_Prediction/d3.csv', colClasses = c("character", "character", "character","character"))
d4 <- read.csv('H:/Documents/R/capstone/app/Word_Prediction/d4.csv', colClasses = c("character", "character", "character","character"))

source('WordPredict')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  #predict from last 3 words
  pred4_input <- reactive ({ tail(unlist(stri_extract_all_words(input$caption)),3) })
  t4 <- reactive ({ paste(pred4_input(), collapse=" ") })
  pred4 <- reactive ({ d4[d4$input==t4(),3] })
  L4 <- reactive( stri_length(pred4()) )
  
  output$L3w <- renderText({t4()})
  output$L3p <- renderText(pred4())
  output$L3l <- renderText(L4())

  #predict from last 2 words
  pred3_input <- reactive ({ tail(unlist(stri_extract_all_words(input$caption)),2) })
  t3 <- reactive ({ paste(pred3_input(), collapse=" ") })
  pred3 <- reactive ({ d3[d3$input==t3(),3] })
  L3 <- reactive( stri_length(pred3()) )
  
  output$L2w <- renderText({t3()})
  output$L2p <- renderText(pred3())
  
  #predict from last word
  pred2_input <- reactive ({ tail(unlist(stri_extract_all_words(input$caption)),1) })
  t2 <- reactive ({ paste(pred2_input(), collapse=" ") })
  pred2 <- reactive ({ d2[d2$input==t2(),3] })
  L2 <- reactive( stri_length(pred3()) )
  
  output$L1w <- renderText({t2()})
  output$L1p <- renderText(pred2())
  
  #predict from common words
  pred1_1 <- d[1,1]
  pred1_2 <- d[2,1]
  pred1_3 <- d[3,1]
  output$L0p <- renderText(paste(pred1_1, pred1_2, pred1_3, collapse=","))
  
  #predicted word (1)
#  if ( length(reactive( {L4()} )) > 1  ) {
#    final_pred <- reactive(pred4()) 
#  } else {
#    final_pred <- "niks gevonden"  
#    }
  
  
#  else if (L3>0) {
#    final_pred <- reactive(pred3())  
#  } else if (L2>0) {
#    final_pred <- reactive(pred2())  
#  } else {
#    final_pred <- "the"    
#    }

#    output$final_pred <- renderText(final_pred())
  
  
    
#  "working"   final_pred <- pred1_1 
  final_pred <- "the"
  if (length(L2())>0) {final_pred <- reactive(pred2())} 
  if (length(L3())>0) {final_pred <- reactive(pred3())} 
  if (length(L4())>0) {final_pred <- reactive(pred4())} 
  
  output$final_pred <- renderText(final_pred())
  
  
  #predicted word (3)
      # in case i want to predict 3 words
  
})
