
# All of the names in here are just placeholders I pulled from the last hw assignment. Feel free to change

ui<- tagList(
      navbarPage(
        theme = shinytheme("flatly"),
        "Federal Funds Rate Change Analysis Analysis",
        
        tabPanel("Introduction",
                 HTML("<h1><center><font size=14> Federal Funds Rate Change Analysis </font></center></h1>
                      <body><center> Angel Lin, Ben Metsker, Jimmy Peng, Jonathan Chen, Mary Truong </center></body>
                      <h3> Project Explanation </h3>
                      <body>
                      <br>
                      Throughout this project, we attempted to find a correlation between federal fund rate changes and different NYSE industry stock performance.
                      </br>
                      <br>
                      The federal funds rate is the interest rate at which banks borrow money from the fed. This number will often affect almost every other aspect of the economy in various ways. 
                      </br>
                      <br>
                      Typically, the Federal Reserve Board (The Fed) will change this underlying rate to counteract recession or inflation. If the economy appears to be in a downturn or Bear Market, the fed will often lower interest rates to make borrowing more appealing to banks, companies, and consumers in order to stimulate the economy. This can have one or two effects on different industries stock performance. First, investors will be encouraged by the Fed’s move and will put more money into the market, causing investment vessel prices to rise. Second, investors could become concerned the market will be turning bear quickly and begin to pull money out consistently, causing market prices to tank. 
                      </br>
                      <br>
                      As clearly seen above, knowing exactly what the stock market like the NYSE will do during rate changes is impossible to predict. However, we believe that we can find a more accurate answers by looking at specific industries rather than the market as a whole.
                      </br>
                      </body>
                      <h3> Major Takeaways </h3>
                      <body>
                      <br>
                      <ol type=1>
                      <li> 
                      We found that there is definitely a correlation between Federal Funds Rate changes and stock performance. In all of the funds that we viewed, there is either a large dip or clime in price or activity whenever monetary policy is changed in a major way.
                      </li>
                      <li>
                      Point 2
                      </li>
                      <li>
                      Point 3
                      </li>
                      </ol>
                      </br>
                      </body>
                      <h3> Sources Used </h3>
                      <body>
                      <br>
                      The federal funds rate data that we chose to use comes from the St. Louis Fed website. The St. Louis Fed is a commonly used government data collection site. We filtered the results down to show only 2006 to 2019. This is a substantial amount of time that captures many ups and downs with FFR changes.
                      </br>
                      <br>
                      The market industry data that we selected comes from Yahoo Finance. The site allows us to select a date range which we matched to our FFR data. Wed selected a wide variety of industries that capture many different areas of the market including:
                      </br>
                      <br>
                      <ul>
                      <li>
                      Technology
                      </li>
                      <li>
                      Consumer Goods
                      </li>
                      <li>
                      Real Estate
                      </li>
                      <li>
                      Healthcare
                      </li>
                      </ul>
                      </br>
                      </body>")
        ), 
        
        tabPanel("Adjusted Close Price",
                 sidebarPanel(
                   dateRangeInput(
                     "Metric1Date", 
                     h3("Date range"), 
                     start = as.Date(0, origin = "2010-02-01"), 
                     end = as.Date(0, origin = "2015-10-01"),
                     min = as.Date(0, origin = "2007-02-01"), 
                     max = as.Date(0, origin = "2019-10-01")),
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
                           HTML("<h4> Analysis </h4>
                                <body>
                                <br>
                                In this graph we visualize the changes between adjusted day close price and updates in the Federal Funds Rate. In 2008, the Mortgage Crisis forced the Federal Reserve board to cut rates drastically down to almost zero in order to stimulate consumer spending. All funds pictured in the graph reacted negatively to the shift. 
                                </br>
                                <br>
                                In 2016, the Federal Reserve board began to raise rates once again, a sign of sturdy economic growth, and instantaneously, we are able to see stocks react in a very positive manner.
                                </br>
                                <br>
                                Consumer Goods saw the biggest jump when rates were raised once again. This is surprising because this industry typically is slower growth and less reactive to outside factors, hence their lower Beta score (a measure of reactivity).
                                </br>
                                </body>
                                ")
                 )
        ),
        
        
        tabPanel("Selling Volume",
                 sidebarPanel(
                   dateRangeInput(
                     "Metric2Date", 
                     h3("Date range"), 
                     start = as.Date(0, origin = "2010-02-01"), 
                     end = as.Date(0, origin = "2015-10-01"),
                     min = as.Date(0, origin = "2007-02-01"), 
                     max = as.Date(0, origin = "2019-10-01")),
                   radioButtons(
                     'Metric2Stock', 
                     'Select Stock', 
                     choices = c(
                       "ConsumerGoods", 
                       "Technology",
                       "Healthcare",
                       "RealEstate"), 
                     selected = "Technology"),
                 ),
                 
                 mainPanel("Volume Chart", plotlyOutput("Metric2Graph"),
                 )
        ),
        
        tabPanel("Fluctuation Rates",
                 sidebarPanel(
                   dateRangeInput(
                     "Metric3Date", 
                     h3("Date range"), 
                     start = as.Date(0, origin = "2010-02-01"), 
                     end = as.Date(0, origin = "2015-10-01"),
                     min = as.Date(0, origin = "2007-02-01"), 
                     max = as.Date(0, origin = "2019-10-01")),
                   radioButtons(
                     'Metric3Stock', 
                     'Select Stock', 
                     choices = c(
                       "ConsumerGoods", 
                       "Technology",
                       "Healthcare",
                       "RealEstate"), 
                     selected = "ConsumerGoods"),
                 ),
                 
                 mainPanel("Fluctuation Chart", plotlyOutput("Metric3Graph"),
                 )
        )
      )
    )
