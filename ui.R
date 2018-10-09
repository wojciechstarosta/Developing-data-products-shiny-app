library(shiny)

shinyUI(fluidPage(
  titlePanel("Parametrization of regression trees"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric", "What should be min value of observation in a leaf?", 
                   value = 10, min = 1, max = 153, step = 1),
      sliderInput("sliderX", "Pick max depth of the tree",
                  0, 10, value = 5),
      sliderInput("sliderY", "Number of cross-validations",
                  0, 20, value = 10),
      checkboxInput("show_title", "Show/Hide CP table", value=TRUE),
      radioButtons("estimation_method", "Estimation method", c("Anova"="anova","Poisson"="poisson")),
      
      h3("Documentation"),
      h5("This application is for checking different types of parametrization in decision tree building process. You can change the following inputs:"),
      h5("- minimal value of observation in a leaf (used to check if tree can divide further)"),
      h5("- maximum depth of a tree (used to set how deep tree should grow)"),
      h5("- number of cross-validations (used to obtain cross-validation error for overfitting issue"),
      h5("- checkbox if cp table should be visible"),
      h5("- radio button for estimation method (you can choose between Anova and Poisson.")
    ),
    mainPanel(
      h3("Regression Tree visualization"),
      plotOutput("plot1"),
      tableOutput("table1")
    )
  )
))
