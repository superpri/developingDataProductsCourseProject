# (for user interface) controls how it looks
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Even more spurious correlation! \\o/"),
    titlePanel("Entretain yourself with some data <3"),
    fluidRow(
        column(4, wellPanel(
            selectInput("first", "Choose the first set of data:",l),
            selectInput("second", "And now the second:", l),
            actionButton("submit","Entretain me")
        )),
        column(8,
               tabsetPanel(
                   tabPanel("Blah blah blah",
                            verbatimTextOutput("text"),
                            verbatimTextOutput("regression")
                   ),
                   tabPanel("OMG GRAPHICS",
                            plotOutput("plot1")
                   )
               )
        )
    )
))