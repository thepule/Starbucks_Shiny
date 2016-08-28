library(shiny)
library(leaflet)

data <- read.csv("starbucks.csv", stringsAsFactors = F)


shinyUI(
        bootstrapPage(
                tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
                leafletOutput("map", width = "100%", height = "100%"),
                absolutePanel(top = 40, left = 10, draggable = T,
                              h1("US Starbucks map"),
                              h4("Instructions:"),
                              p("Type in the box below the name of the city you want to
                                explore.", br(), 
                                "Click and drag to move the map.", br(),
                                "The + and - buttons
                                in the top left corner allow for zooming.", br(),
                                "This same panel containing the selectors,", br(),
                                "can be dragged around.", br(),
                                "Clicking on the markers on the map opens,", br(),
                                "up a popup with extra info on the shop."), 
                              selectInput("city", "Select City",
                                          unique(data$City),
                                          selected = "San Francisco"
                              ),
                              checkboxGroupInput("checkgroup",
                                                 "Select ownership type",
                                                 choices = list(
                                                        "Licensed" = "Li",
                                                        "Company Owned" = "CO"
                                                        ),
                                                 selected = c("Li", "CO"))
                )
        )
)