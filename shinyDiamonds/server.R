#
# This is the server logic of a shinyDiamonds price predicter.
# Refer to the readme document for further information.
#

library(shiny)
library(UsingR)
data(diamond)

# Define server logic required to PLOT AND PREDICT PRICE

shinyServer(function(input, output) {
        
        model <- lm(price ~ carat, data = diamond)
        
        ##use reactive wrapper
        pred <- reactive({
                caratInput <-input$sliderCarat
                predict(model, newdata = data.frame(carat = caratInput))
        })
        output$plot1 <- renderPlot({
                caratInput <- input$sliderCarat
                
                plot(diamond$carat, diamond$price, xlab = "Carats",
                     ylab = "Price (Sin dollars)", bty = "n", pch = 16,
                     xlim = c(0.15, 0.35), ylim = c(200, 1000))
                if(input$showModel){
                        abline(model, col = "red", lwd = 2)
                }
                points(caratInput, pred(), col = "red", pch = 16, cex = 2)
        })
        output$pred <- renderText({
                pred()
        })
})
