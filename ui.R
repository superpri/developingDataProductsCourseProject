# (for user interface) controls how it looks
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Even more spurious correlation!"),
    titlePanel("submitButton example"),
    fluidRow(
        column(3, wellPanel(
            selectInput("first", "Choose the first variable:",l),
            selectInput("second", "And now the second:", l),
            actionButton("submit","Submit")
        )),
        column(6,
               
               verbatimTextOutput("text")
        )
    )
))