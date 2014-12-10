# controls what it does.
library(shiny)

shinyServer(
    function(input, output, session) {
        output$firstValue <- renderPrint({input$first})
        
        observe({
            if (input$first != "") {
                new_l <- l[-which({input$first} == l)[[1]]]
                updateSelectInput(session, "second", choices=new_l)
            }
        })
    }
)