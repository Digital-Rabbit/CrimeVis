## server.R
## Server file for crime rate visualization

## runApp("crimeVis",display.mode='showcase')

## One-time set up
source("mapping.R")
library(maps)
library(mapproj)

# Read in state/region names and the scaled arrest data and the urban
# population data.
# The data were preprocessed to avoid the need to process every time a user
# visits the site.
ArrestData <- read.csv("Data/arrestData.csv")

shinyServer(function(input, output) {
    output$map <- renderPlot({
        
        ## Each time a user interacts, define variables that effect the UI
        data <- switch(input$radio, 
                       "Assault" = ArrestData$scaledAssault,
                       "Murder" = ArrestData$scaledMurder,
                       "Rape" = ArrestData$scaledRape,
                       "Urban Population" = ArrestData$scaledUrban)
        
        color <- switch(input$radio, 
                        "Assault" = "darkorange",
                        "Murder" = "red",
                        "Rape" = "black",
                        "Urban Population" = "darkgreen")
        
        legend <- switch(input$radio, 
                         "Assault" = "Assault",
                         "Murder" = "Murder",
                         "Rape" = "Rape",
                         "Urban Pop.")
        
      percent_map(var = data, color = color, legend.title = legend)
        
    })
})