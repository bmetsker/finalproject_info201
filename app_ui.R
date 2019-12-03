
# All of the names in here are just placeholders I pulled from the last hw assignment. Feel free to change

ui<- tagList(
      navbarPage(
        theme = shinytheme("flatly"),
        "Midwest Population Analysis",
        
        tabPanel("Introduction",
                 main_title,
                 team_members,
                 project_explanation_title,
                 project_explanation,
                 project_sources_title,
                 sources_explanation
        ), 
        
        tabPanel("Metric 1",
                 sidebarPanel(
                   dateRangeInput(
                     "Metric1Date", 
                     h3("Date range"), 
                     start = as.Date(0, origin = "2007-02-01"), 
                     end = as.Date(0, origin = "2015-02-01"),
                     min = as.Date(0, origin = "2007-02-01"), 
                     max = as.Date(0, origin = "2015-02-01")),
                   selectInput(
                     'Metric1Stock', 
                     'Select Stock', 
                     choices = c(
                       "ProShares", 
                       "Nasdaq",
                       "VHT",
                       "ICF"), 
                     selected = "ProShares"),
                 ),
                 
                 mainPanel("Comparison Chart", plotlyOutput("Metric1Graph"),
                 )
        ),
        
        
        tabPanel("Metric 2",
                 sidebarPanel(
                   dateRangeInput(
                     "Metric2Date", 
                     h3("Date range"), 
                     start = as.Date(0, origin = "2007-02-01"), 
                     end = as.Date(0, origin = "2015-02-01"),
                     min = as.Date(0, origin = "2007-02-01"), 
                     max = as.Date(0, origin = "2015-02-01")),
                   radioButtons(
                     'Metric2Stock', 
                     'Select Stock', 
                     choices = c(
                       "ProShares", 
                       "Nasdaq",
                       "VHT",
                       "ICF"), 
                     selected = "Nasdaq"),
                 ),
                 
                 mainPanel("Volume Chart", plotlyOutput("Metric2Graph"),
                 )
        ),
        
        tabPanel("Metric 3",
                 sidebarPanel(
                   dateRangeInput(
                     "Metric3Date", 
                     h3("Date range"), 
                     start = as.Date(0, origin = "2007-02-01"), 
                     end = as.Date(0, origin = "2015-02-01"),
                     min = as.Date(0, origin = "2007-02-01"), 
                     max = as.Date(0, origin = "2015-02-01")),
                   radioButtons(
                     'Metric3Stock', 
                     'Select Stock', 
                     choices = c(
                       "ProShares", 
                       "Nasdaq",
                       "VHT",
                       "ICF"), 
                     selected = "VHT"),
                 ),
                 
                 mainPanel("Fluctuation Chart", plotlyOutput("Metric3Graph"),
                 )
        )
      )
    )
