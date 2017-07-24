# Takes a text as input
# Returns the next word as output

WordPredict <- function (text_input, d, d2, d3, d4) {
  
  library(stringi)
  setwd('H:/Documents/R/capstone/app/Word_Prediction')
  
  last_3_words <- paste(tail(unlist(stri_extract_all_words(text_input)),3), collapse=' ')
  pred_word_4 <- d4[d4$input==last_3_words,3]
  
  last_2_words <- paste(tail(unlist(stri_extract_all_words(text_input)),2), collapse=' ')
  pred_word_3 <- d3[d3$input==last_2_words,3]
  
  last_1_words <- paste(tail(unlist(stri_extract_all_words(text_input)),1), collapse=' ')
  pred_word_2 <- d2[d2$input==last_1_words,3]
  
  prediction <- 'the'
  if (length(pred_word_2)>0) {prediction <- pred_word_2}
  if (length(pred_word_3)>0) {prediction <- pred_word_3}
  if (length(pred_word_4)>0) {prediction <- pred_word_4}
  prediction
  
  }