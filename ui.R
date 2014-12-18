# (for user interface) controls how it looks
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Even more spurious correlation! \\o/"),
    titlePanel("Entretain yourself with some data <3"),
    fluidRow(
        column(4, wellPanel(
            selectInput("first", "Choose the first set of data:",l),
            selectInput("second", "And now the second:", l),
            actionButton("submit","Entretain me"),
            br(),
            p(strong(em("Documentation:",a("Even more spourious correlation!",
                                           href="READMe.html")))),
            p(strong(em("Github repository:",a("Developing Data Products Course Project",
                                               href="https://github.com/superpri/developingDataProductsCourseProject"))))
        )),
        column(8,
               tabsetPanel(
                   tabPanel("Information!",
                        verbatimTextOutput("text"),
                        conditionalPanel(
                            condition = "input.submit > 0",
                            p("What do we know about this? Hm?"),
                            tags$ul(
                                tags$li("We're trying to predict if first can predicted by second"),
                                tags$ul(
                                    tags$li(verbatimTextOutput("variableFirst")),
                                    tags$li(verbatimTextOutput("variableSecond"))
                                ),
                                
                                tags$li("We garantee that the quality of the model is:"),
                                tags$ul(
                                    tags$li(verbatimTextOutput("quality"))
                                ),
                                
                                tags$li("Even further, our model is:"),
                                tags$ul(
                                    tags$li(verbatimTextOutput("fstatistic"))
                                )
                            )
                        )
                   ),
                   tabPanel("OMG GRAPHICS!",
                        conditionalPanel(
                            condition = "input.submit > 0",
                            p("Let's see the relation between our data! Weehee!"),
                            p("Clearly, out model correlates the data! Look:"),
                            verbatimTextOutput("correlation"),
                            plotOutput("plot1")
                        )
                   )
               )
        )
    )
))