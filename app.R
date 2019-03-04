# Load packages
library(shiny)
library(tidyRSS)

news <- tidyfeed("https://researchit.las.iastate.edu/news.xml")

ui -< fluidPage(
    titlePanel("ResearchIT Shiny Demo"),
    mainPanel(
        plotOutput(outputID = "distPlot")
    )
)

server <- function(input, output) {
    output$distPlot <- renderPlot({
        x <- news$pubDate
        
        hist(x, breaks=5, xlab = "test", main = "hist")
    })
}

shinyApp(ui = ui, server = server)