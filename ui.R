## ui.R
## User interface definition for crime rate visualization

shinyUI(fluidPage(
    
    titlePanel("Crime Rate Visualization for USA (1973)"),
    sidebarLayout(
        sidebarPanel(
            radioButtons("radio",label="Choose an item to display:",
                        choices = c("Assault", "Murder", "Rape","Urban Population"),
                        selected = "Assault"), 
            helpText("You can choose either one of three crimes, or urban 
                     population. Rates are scaled relative to the other states, on
                     a scale of 0 (lowest) to 100 (highest). Deeper shades mean
                     higher crime rates or higher percentage of population living
                     in urban areas.")
        ),
        mainPanel(
            plotOutput("map")
        )
        
    )
))  
    
    
    
    
    