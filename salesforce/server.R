library("RForcecom")
library("shiny")
library("rCharts")

#  server
shinyServer(function(input, output) {
  
  dataInput <- reactive({
    
    args <- c()
    args$start <- input$dates[1]
    args$end <- input$dates[2]
    do.call(runQuery, args)         
  })
  
  output$myChart <- renderChart({ 
    
    p2 <- rPlot(mbsu_Time_to_Repair__c ~ CreatedDate, color = 'mbsu_Case_Product__c', 
                type = 'line', data = dataInput())
    p2$guides(y = list(min = 0, title = ""))
    p2$guides(y = list(title = ""))
    p2$addParams(height = 300, dom = 'myChart',title="Time to Repair")
    return(p2)
  })
  
})
  

