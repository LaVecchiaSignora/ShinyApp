#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Diamond prediction"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("Scarat", "Price of  diamond?", 0, 6, value = 0.1),
            checkboxInput("regline", "Regression line on/off", value = TRUE),
            submitButton("Submit") 
             ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot1"),
            h3("Diamond prediction"),
            textOutput("prediction"),
        )
    )
))
