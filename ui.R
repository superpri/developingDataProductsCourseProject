# (for user interface) controls how it looks
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Even more spurious correlation!"),
    sidebarPanel(
        selectInput("first", "Choose the first variable:",l),
        
        conditionalPanel(
            condition = "input.first != ''",
            selectInput("second", "Server updated:", choices = NULL, selected = NULL)
        )
          
    ),
    mainPanel(
        p('Output First'),
        textOutput('firstValue')
    )
))