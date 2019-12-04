
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
                   selectInput('x1', 'Select X-Axis:', choices = c("state", "category"),
                               selected = "state"),
                   selectInput('y1', 'Select Y-Axis:', choices = c( "popwhite", "popblack", "poptotal", "popamerindian", "popasian"), 
                               selected = "poptotal"),
                 ),
                 
                 mainPanel("Racial Variance", plotOutput(outputId = "popchart")
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
                 sidebarPanel(
                   radioButtons('x2', 'Change X-Axis:', choices = c("percollege", "percbelowpoverty", "percchildbelowpovert", "percadultpoverty", "percelderlypoverty"),
                                selected = "percollege"),
                   radioButtons('y2', 'Change Y-Axis:', choices = c("poptotal", "popwhite", "popblack", "popamerindian", "popasian"),
                                selected = "poptotal")
                   # Radio Buttons on different races 
                 ),
                 
                 mainPanel("College Attendace", plotOutput(outputId = "collegechart"),
                 )
        )
      )
    )