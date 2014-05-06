library("RForcecom")
library("shiny")
library("rCharts")

options(RCHART_LIB = 'polycharts')
shinyUI(fluidPage(
  titlePanel("Product Specialist Calls"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select Range of Dates"),
      
      dateRangeInput("dates", 
                     "Date range",
                     start = "2014-04-28", # get beginning of last week
                     end = as.character(Sys.Date()))
    ),
    
    mainPanel(showOutput("myChart", "polycharts"))
  )
))