# controls what it does.
library(shiny)
library(ggplot2)

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
            if (input$submit > 0) {
                if (input$first != input$second){
                    reg <- regression(df[,input$first], df[,input$second])
                    return(capture.output(summary(reg)))
                }
            }
        })
        output$plot1 <- renderPlot({
            if (input$submit > 0) {
                if (input$first != input$second){
                    plot.obj<<-list() # not sure why input$X can not be used directly?
                    plot.obj$data<<-df 
                    plot.obj$x<<-with(plot.obj$data,get(input$first)) 
                    plot.obj$y<<-with(plot.obj$data,get(input$second)) 
                    
                    return(ggplot(plot.obj$data,aes(x=plot.obj$x, y=plot.obj$y))+geom_point())
                }
            }
        })
    }
)