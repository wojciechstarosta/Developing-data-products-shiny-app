#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(rpart)

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    set.seed(32323)
    number_of_obs <- input$numeric
    max_depth <- input$sliderX[1]
    cv <- input$sliderY[1]
    maxY <- input$sliderY[2]
    dist <- switch(input$estimation_method, anova = "anova", poisson = "poisson", anova)
    tree1<-rpart(formula=Ozone ~ .,airquality, method=dist, cp=0,maxdepth=max_depth,minbucket=number_of_obs, xval=cv)
    plot(tree1, uniform=TRUE, compress=TRUE)
    text(tree1, use.n = FALSE, all=FALSE)
  })
  output$table1 <- renderTable({
    set.seed(32323)
    number_of_obs <- input$numeric
    max_depth <- input$sliderX[1]
    cv <- input$sliderY[1]
    maxY <- input$sliderY[2]
    dist <- switch(input$estimation_method, anova = "anova", poisson = "poisson", anova)
    tree1<-rpart(formula=Ozone ~ .,airquality, method=dist, cp=0,maxdepth=max_depth,minbucket=number_of_obs, xval=cv)
    if (input$show_title)
      {
      printcp(tree1)
      }
    })}
)
