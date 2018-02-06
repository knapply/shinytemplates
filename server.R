library(shiny)
library(plyr)
library(httr)
library(rjson)

shinyServer(function(input, output) {
  
  ntext <- eventReactive(input$goButton, {
    print(input$url)
    if (input$url == "http://") {
      baseURL
    } else {
      baseURL <<- input$url 
    }
  })
  
  getURL <- reactive({
    if (input$url == "http://") {
      baseURL
    } else {
      input$url
    }
  })
  
  
  output$image <- renderUI({
    url <- getURL()
    HTML(paste0('<img src="', url ,'"height="400" width="600" /> '))
  })
  

  
})