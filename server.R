#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
   
  output$distplot <- renderPlot({
    
    # generate distibution from ui.R
    distype<- input$Distribution 
    size<- input$sampleSize
    
    
    if(distype == "Normal"){
      X<- rnorm(size, mean= as.numeric(input$mean), sd=as.numeric(input$sd))
      
    }
    else {
      
      X<- rexp(size, rate=1/ as.numeric(input$lambda))
      
    }
    
  
    # draw the histogram 
    hist(X, col = 'red')
    
  })
  
})
