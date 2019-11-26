
# All of the names in here are just placeholders I pulled from the last hw assignment. Feel free to change.
source("storedtext.R")

ui<- tagList(
  navbarPage(
    theme = shinytheme("flatly"),
    "Federal Funds Rate Change Analysis",
    
    tabPanel("Introduction",
             h1(test),
             test_text,
             img("lol", src = "Pictures/fc4801baa943d9526e81f45bd0473ea5.jpg")
             ),
    
    tabPanel("FFR/Industry Correlation",
             sidebarPanel(
               selectInput('x1', 'Select X-Axis:', choices = c("state", "category"),
                           selected = "state"),
               selectInput('y1', 'Select Y-Axis:', choices = c( "popwhite", "popblack", "poptotal", "popamerindian", "popasian"), 
                           selected = "poptotal"),
             ),
             
             mainPanel("Racial Variance", plotOutput(outputId = "popchart"),
             )
          ),
    
    
    tabPanel("Volume by Industry",
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
    
    
    tabPanel("Title?",
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
