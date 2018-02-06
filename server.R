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
  
  ##########################################
  v <- reactiveValues(doPlot = FALSE)
  
  observeEvent(input$goButton, {
    v$doPlot <- input$goButton
  })
  output$res <- renderText({
    
    if (v$doPlot == FALSE) return()
    
    
    isolate({
      
      mscs_out <- Analyse_image(input_image = getURL(),MCCS_Key = my_key,visualFeature_options = "Description")
      mscs_out. <- content(mscs_out)
      mscs_out.$description$captions[[1]]$text
      
    })
    
  })
  
})