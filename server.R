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
                input$submit 
                if (input$first != input$second){
                    reg <- regression(df[,input$first], df[,input$second])
                    return(capture.output(summary(reg)))
                }
            }
        })
        output$plot1 <- renderPlot({
            if (input$submit > 0) {
                input$submit 
                if (input$first != input$second){
                    
                    # sweat, blood, and tears until reaching this solution
                    plot.obj<<-list() 
                    plot.obj$data<<-df 
                    plot.obj$x<<-with(plot.obj$data,get(input$first)) 
                    plot.obj$y<<-with(plot.obj$data,get(input$second)) 
                    
                    return(ggplot(plot.obj$data,aes(x=plot.obj$x, y=plot.obj$y))+
                               geom_point()+
                               labs(x = input$first, y=input$second)+
                               stat_smooth(method="lm"))
                }
            }
        })
    }
)