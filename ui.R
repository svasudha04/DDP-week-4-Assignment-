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
shinyServer(fluidPage(
  
  # Application title
  titlePanel("App for the distibution "),
  
  # Sidebar with a slider input for Distibution 
  sidebarLayout(
    sidebarPanel(
       selectInput("Distribution","Distribution Type",
                   choices=c("Binomial", "Exponential", "Normal")),
       sliderInput("sampleSize", "Number of Sample Size: ",
                   min=10, max=7000, value= 1000, step=100),            
       conditionalPanel(condition="input.Distribution == 'Binomial'",
                        textInput("n", "no. of observations:"),
                        textInput("p", "select the Success prob")),
       conditionalPanel(condition="input.Distribution == 'Exponential'",
                        textInput("lambda", "select the lambda", 1)),
       conditionalPanel(condition="input.Distribution == 'Normal'",
                        textInput("mean", "select mean", 26),
                        textInput("sd", "select the standardeviation",4))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distplot")

     )
   
    )
  )
)
