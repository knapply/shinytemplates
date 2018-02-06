library(shiny)


shinyUI(pageWithSidebar(
  headerPanel(title = "Image Classifier"
  ),
  
  sidebarPanel(
    tabsetPanel(
      id = "tabs",
      tabPanel(
        "URL Input",
        textInput("url", "Target Site", ""),
        helpText("Input the homepage URL of target site."),
        actionButton("goButton", "RUN")
      )
    )
  ),
  
  mainPanel(
    h3("Image"),
    hr(),
    
    uiOutput("image"),
    hr(),
    
    h3("Content Description:"),
    textOutput("res")
    
  )
))