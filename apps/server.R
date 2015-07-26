library(shiny)

HRCData <- read.csv('HRCData.csv')
StaffNumbers <- HRCData[,grepl('Department|Year|Head|FTEs|Managers|fixed', names(HRCData))]
EthnicStats <- HRCData[,grepl('Department|Year|Pacific|Maori|Asian|Women|Age', names(HRCData))]
OtherStats <- HRCData[,grepl('Department|Year|Tenure|sick|leave|Turnover|turnover', names(HRCData))]

shinyServer(function(input, output) {
        
        # a large table, reative to input$show_vars
        output$mytable1 <- renderDataTable({
                StaffNumbers[, input$show_vars, drop = FALSE]
        })
        
        # sorted columns are colored now because CSS are attached to them
        output$mytable2 <- renderDataTable({
                EthnicStats[, input$show_vars2, drop = FALSE]
        })
        
        # customize the length drop-down menu; display 5 rows per page by default
        output$mytable3 <- renderDataTable({
                OtherStats[, input$show_vars3, drop = FALSE]
        })
        
})



