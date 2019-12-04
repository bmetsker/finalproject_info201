
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
                       "ConsumerGoods", 
                       "Technology",
                       "Healthcare",
                       "RealEstate"), 
                     selected = "ConsumerGoods"),
                 ),
                 
                 mainPanel("Comparison Chart", plotlyOutput("Metric1Graph"),
                 )
        ),
        
        
        tabPanel("Metric 2",
                 sidebarPanel(
                   radioButtons('x2', 'Change X-Axis:', choices = c("percollege", "percbelowpoverty", "percchildbelowpovert", "percadultpoverty", "percelderlypoverty"),
                                selected = "percollege"),
                   radioButtons('y2', 'Change Y-Axis:', choices = c("poptotal", "popwhite", "popblack", "popamerindian", "popasian"),
                                selected = "poptotal")
                   # Radio Buttons on different races 
                 ),
                 
                 mainPanel("College Attendace", plotOutput(outputId = "collegechart"),
                 )
        ),
        
        tabPanel("Metric 3",
                 sidebarPanel(),
                 
                 mainPanel()
        )
      )
    )
