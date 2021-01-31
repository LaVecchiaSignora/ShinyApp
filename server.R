#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)
data(diamond)

shinyServer(function(input, output) {
    
    model <- lm(price ~ carat, diamond)
    
    modelpred <- reactive({
        CInput <- input$Scarat
        predict(model, newdata = data.frame(carat = CInput))
    })
    
    output$Plot1 <- renderPlot({

        
        CInput <- input$Scarat
        
        plot(diamond$carat, diamond$price, xlab = "Mass (carats)", 
             ylab = "Price (SIN $)", bty = "n", pch = 16,
             xlim = c(0, 6), ylim = c(0, 20000))
        if(input$regline){
            abline(model, col = "red", lwd = 2)
        }
        points(CInput, modelpred(), col = "red", pch = 16, cex = 2)
        
        
    })
    
    output$pred <- renderText({
        modelpred()
    })
})
