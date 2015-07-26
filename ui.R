library(shiny)
library(ggplot2)  # for the HRCData dataset
HRCData <- read.csv('HRCData.csv')
StaffNumbers <- HRCData[,grepl('Department|Year|Head|FTEs|Managers|fixed', names(HRCData))]
EthnicStats <- HRCData[,grepl('Department|Year|Pacific|Maori|Asian|Women|Age', names(HRCData))]
OtherStats <- HRCData[,grepl('Department|Year|Tenure|sick|leave|Turnover|turnover', names(HRCData))]

shinyUI(fluidPage(
        sidebarLayout(
                sidebarPanel(
                        helpText("Welcome to my simple Shiny App, based on open government",
                                 "data. Pick your group of interest, (i.e. StaffNumbbers, Ethnic",
                                 "or Other Stats, and then select the variables of interest.",
                                 "It is designed to save time subsetting a large dataset"),
                        conditionalPanel(
                                'input.dataset === "StaffNumbers"',
                                checkboxGroupInput('show_vars', 'Columns in StaffNumbers to show:',
                                                   names(StaffNumbers), selected = names(StaffNumbers))
                        ),
                        conditionalPanel(
                                'input.dataset === "EthnicStats"',
                                checkboxGroupInput('show_vars2', 'Columns in EthnicStats to show:',
                                                   names(EthnicStats), selected = names(EthnicStats))
                        ),
                        conditionalPanel(
                                'input.dataset === "OtherStats"',
                                checkboxGroupInput('show_vars3', 'Columns in OtherStats to show:',
                                                   names(OtherStats), selected = names(OtherStats))
                        )
                ),
                mainPanel(
                        tabsetPanel(
                                id = 'dataset',
                                tabPanel('StaffNumbers', dataTableOutput('mytable1')),
                                tabPanel('EthnicStats', dataTableOutput('mytable2')),
                                tabPanel('OtherStats', dataTableOutput('mytable3'))
                        )
                )
        )
))