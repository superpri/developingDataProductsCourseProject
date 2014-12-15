# controls what it does.
library(shiny)

#prediction funcion
regression <- function(first,second) lm(first ~ second)

shinyServer(
    function(input, output) {
        output$text <- renderText({
            if (input$first != "" &&  input$second != ""){
                if (input$first != input$second)
                    paste("We'll correlate",input$first,"with",input$second,"!",
                          randomCoolWord())
                else
                    paste("This shiny app already does spourious things...",
                          "Would you be a dear and please pick different sets of",
                          "data so I can play with? *blinks*")
            }
        })
        output$regression <- renderText({
            #if (input$submit != 0) }
                input$submit
                #regression(input$first, input$second)
                regression(df[,input$first], df[,input$second])
            #}
        })
    }
)