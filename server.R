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

        output$plot1 <- renderPlot({
            input$submit 
            isolate(
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
            )
        })
        output$variableFirst <- renderText({
            input$submit 
            isolate(
                if (input$first != input$second){
                    paste("First:",input$first)
                }
            )
        })
        output$variableSecond <- renderText({
            input$submit 
            isolate(
                if (input$first != input$second){
                    paste("Second:",input$second)
                }
            )
        })
        output$quality <- renderText({
            input$submit 
            isolate(
                if (input$first != input$second){
                    reg <- regression(df[,input$first], df[,input$second])
                    if (summary(reg)$r.squared > 0.7)
                        paste("VERY HIGH! (R² =",summary(reg)$r.squared,")")
                    else if (summary(reg)$r.squared < 0.7 &&
                                 summary(reg)$r.squared > 0.4)
                        paste("GOOD! (R² =",summary(reg)$r.squared,")")
                    else
                        paste("OK! (R² =",summary(reg)$r.squared,")")
                }
            )
        })
        
        output$fstatistic <- renderText({
            input$submit 
            isolate(
                if (input$first != input$second){
                    reg <- regression(df[,input$first], df[,input$second])
                    paste("SIGNIFICANT! (F statistic:",summary(m)$fstatistic[1],")")
                }
            )
        })
        
        output$correlation <- renderText({
            input$submit 
            isolate(
                if (input$first != input$second){
                    paste("Correlation coefficient:",cor(df[,input$first], df[,input$second]))
                }
            )
        })
    }
)