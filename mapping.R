## mapping.R
## Mapping function for crime visualization

## var is a vector of data: Assault, Murder, Rape, Urban Population
## color is the color set for the var vector
## legend.title is the variable name
## Crime rates are scaled relative to each other, from 0 to 100

percent_map <- function(var, color, legend.title) {    
    # generate a vector of 100 gradients fill colors for map
    shades <- colorRampPalette(c("white", color))(100)
    
    # transform floating-point data to integers; this data is either the crime rate
    # or urban population percentage
    percents <- as.integer(cut(var, 100, include.lowest = TRUE, ordered = TRUE))
    
    # create a vector that represents data as a shade from the shade vector
    fills <- shades[percents]   
    
    # plot a choropleth map
     map("state", fill = TRUE, col = fills, lty = 1, lwd= 1)   
    
    # overlay state borders
     map("state", col = "gray", fill = FALSE, add = TRUE)
    
    # add a legend 
    inc <- 25
    legend.text <- c(paste0("< 25"),
                     paste0(inc),
                     paste0(2 * inc),
                     paste0(3 * inc),
                     paste0(4 * inc))   
    
    # place the legend, add color patches and a title
    legend("bottomleft", 
           legend = legend.text, 
           fill = shades[c(1, 25, 50, 75, 100)], 
           title = legend.title)
    
}
