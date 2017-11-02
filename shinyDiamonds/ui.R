#
# This is the user-interface definition of shinyDiamonds price predicer
# Refer to the readme document for more information. 
#

library(shiny)
library(UsingR)
data(diamond)

# Predict diamond price based on weight
shinyUI(fluidPage(
        titlePanel("Find your price based on diamond weight"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderCarat", "How Many Carats?", 0.15, 0.35, value = 0.20),
                        checkboxInput("showModel", "Show/Hide Model", value = TRUE)
                ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted Price (SIN DOLLARS):"),
                        textOutput("pred")
                )
        )
))