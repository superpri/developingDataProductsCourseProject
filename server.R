# controls what it does.
library(shiny)

shinyServer(
    function(input, output, session) {
        output$text <- renderText({
            if (input$submit != 0){
                if (input$first != input$second)
                    paste("We'll correlate",{input$first},"with",{input$second})
                else
                    paste("Would you be a dear and please pick different sets of",
                          "data so I can correlate? *blinks*")
            }
        })
    }
)