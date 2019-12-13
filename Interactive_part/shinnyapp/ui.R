shinyUI(fluidPage(
  tags$style(type = 'text/css', 'html, body {width:100%;height:100%}'),
  tags$title("Stock Market analysis by CAPM"),
  fluidRow(
    column(4, 
        tags$h4("Click to change the date",style = "color:red"),
        wellPanel(style = "background: lightblue",
          fluidRow(
            column(4,
                   textInput("indexTicker", "Standard Market", value = "SPY", width = "100%")
            ),
            column(8,
                   selectInput("tickersList", "Yahoo finance tickers", c("yahoo.csv"), width = "100%")
            )
          ),
          tags$b("Pick a last period quickly"),
          fluidRow(
            column(4,
                   actionButton(inputId = "last1Button", label = "1 month", width = "100%")
            ),
            column(4,
                   actionButton(inputId = "last6Button", label = "6 months", width = "100%")
            ),
            column(4,
                   actionButton(inputId = "lastYearButton", label = "Year", width = "100%")
            )
          ),
           fluidRow(
              column(4,
                     dateInput(inputId = "dateFrom", label = "Start date", value = seq(Sys.Date(), length=2, by = "-364 days")[2],
                               format = "yyyy-mm-dd", width = "100%")
              ),
              column(4,
                     dateInput(inputId = "dateTo", label = "End date", value = Sys.Date(),
                               format = "yyyy-mm-dd", width = "100%")
              ),
              column(4,
                     numericInput(inputId = "rfrInput", label = "Risk-free%", value = 5.0, 
                                  min = 0.0, max = 100.0, step = 0.25, width = "100%")
              )
           ),
           
        ),
        tags$h4("Market return based on SPY",style = "color:red"),
        wellPanel(style = "background: lightblue",
          fluidRow(
            column(12,
                   plotly::plotlyOutput(outputId = "smlPlot", width = "100%")  
            )
          )
          
         
        )
    ),
    column(8,
           tags$h4("Analyzed stocks",style = "color:red"),
           fluidRow( 
             column(12,
                    wellPanel(style = "background: lightblue",
                      DT::dataTableOutput(outputId = "stocksTable", width = "100%")
                    )
             )
           )
           
    ),
    
  )
))