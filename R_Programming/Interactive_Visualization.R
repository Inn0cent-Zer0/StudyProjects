# Plotly is an open source graphing library which allows us to create interactive charts and plots.
# It has easy integration with ggplot2 as well as Dash and Shiny.

library(plotly)   # Load the plotly library for interactive plotting
library(tidyverse)  # Load tidyverse for data manipulation functions

View(mtcars)   # View the mtcars dataset in a spreadsheet-like viewer (like Excel)

# Create a basic plotly plot object with mpg on x-axis and disp on y-axis
inosuke <- mtcars %>%
  plot_ly(x = ~mpg, y = ~disp)

# Display the plotly plot object
inosuke

# The plot_ly function takes our data objects and maps them to the plotly graphing library.
# The layout function allows us to specify attributes of the x and y axes and the type of chart.
# The traces function is similar to geoms in ggplot2.

# Show all of the different functions that plotly provides to add traces
stringr::str_subset(objects("package:plotly"), pattern = "^add_")

# Reassign the inosuke variable with a plotly plot object, this time with a customized layout
inosuke <- mtcars %>%    # Assign the pipe operator (%) result of mtcars dataset to inosuke
  plot_ly(x = ~mpg, y = ~disp) %>%  # Create a plotly plot object with mpg on x-axis and disp on y-axis
  layout(     # Customize the layout of the plot
    title = "Miles per Gallon vs Displacement",  # Set the title of the plot
    xaxis = list(title = "Miles per Gallon",     # Customize x-axis properties
                 range = c(10,35)),              # Set the range of x-axis values
    yaxis = list(title="Displacement",           # Customize y-axis properties
                 range=c(50,500))                 # Set the range of y-axis values
  )

inosuke <- mtcars %>%    # Take the mtcars dataset and pipe it into the next operation
  plot_ly(               # Start creating a plotly plot
    x = ~factor(cyl),    # Define the x-axis variable as 'cyl', converted to a factor
    y = ~mpg,            # Define the y-axis variable as 'mpg'
    type = "scatter",    # Specify the type of plot as a scatter plot
    name = "Scatter"     # Name this trace as "Scatter"
  ) %>% 
  add_boxplot(name = "Boxplot")  # Add a boxplot trace to the existing plotly plot, named "Boxplot"

inosuke  # Display the resulting plotly plot object

airquality %>%
  plot_ly(x= ~Temp) %>%
  add_trace(y=~Ozone, type = "scatter") %>%
  layout(title = "Temperature vs Ozone",
         xaxis=list(title="Temperature"),
         yaxis=list(title="Ozone")
  )
airquality %>%
  plot_ly(x= ~Temp, y= ~Ozone) %>%
  layout(title = "Temperature vs Ozone",
         xaxis=list(title="Temperature"),
         yaxis=list(title="Ozone")
  )

x = seq(-2*pi, 2*pi, by = 1/1000) 
Iambored <- data.frame(x = x, y = sin(x),    
                       z = cos(x)) 
figure <- Iambored %>%  
  plot_ly(x = ~x) %>%  
  add_lines(y = ~y, name = "Sine") %>%   
  add_lines(y = ~z, name = "Cosine") %>%  
  layout(   
    title = "Sine and Cosine",   
    xaxis = list(rangeslider = list(type = "x")) 
  ) 
figure

#Geo-spatial data
# there is a special function called plot_geo 
# thsi works in the same was the the plot_ly
# but, it is specific for latitude &  longitude co-ordinates
# so if we take our data frame and pipe 
# into plot_geo and then we can set the lat to be the latitude
# lon = longitude
sunshine <<- read.csv(  
  'https://raw.githubusercontent.com/plotly/datasets/master/2015_06_30_precipitation.csv'
)
# here we have the world map and the locations 
# plotted on the map when we hover over the points
# we can see the specific longitude  and longitude co-ordinates
# we can also  zoom in on this map

sunshine %>% head()
fig <- sunshine %>% 
  plot_geo(lat = ~Lat, lon = ~Lon)
fig
# notice that  the above dosn't actually have any
# information about the percipitation
# this is purely just scatter plot of the locstion on a map
# so we can add the percipitation values
# on this map by using a trace function 
fig <- fig %>%   
  add_markers(     
    text = ~paste("Precipitation:", Globvalue)   
  ) 
fig
# the above functions adds the word precipitation to the location when it is hovered

# Customise markers further
# 
fig <- sunshine %>%  
  plot_geo(lat = ~Lat, lon = ~Lon) %>% 
  add_markers(    
    text = ~paste("Precipitation:", Globvalue),  
    color = ~Globvalue,     
    symbol = I("square"),     
    size = I(8),     
    hoverinfo = "text",   
    opacity = I(0.8)
  ) 
fig
# Add titles
fig <- fig %>%  
  colorbar(title = "Precipitation June 2015") %>%   
  layout(   
    title = 'Precipitation levels across America' 
  ) 
fig
# Customise markers further
fig <- sunshine %>%  
  plot_geo(lat = ~Lat, lon = ~Lon) %>% 
  add_markers(    
    text = ~paste("Precipitation:", Globvalue),  
    color = ~Globvalue,     
    symbol = I("square"),     
    size = I(8),     
    hoverinfo = "text",   
    opacity = I(0.8)
  ) 
fig

# Add titles
fig <- fig %>%  
  colorbar(title = "Precipitation June 2015") %>%   
  layout(   
    title = 'Precipitation levels across America' 
  ) 
fig
# Further customisation
goms <- list(  
  scope = 'usa',   
  projection = list(type = 'albers usa'),  
  showland = TRUE,  
  landcolor = toRGB("gray95"),  
  subunitcolor = toRGB("gray85"), 
  countrycolor = toRGB("gray85"),  
  countrywidth = 0.5,   
  subunitwidth = 0.5 
) 
fig <- fig %>%  
  layout(  
    geo = goms  
  ) 
fig
# INTEGRATION WITH GGPLOT2

set.seed(23) 
df <- data.frame(x = rnorm(1000)) 

# ggplot object
p <- df %>%  
  ggplot(aes(x = x)) + 
  geom_histogram(aes(y = ..density..), colour = "gray", fill = "white") +  
  geom_density(fill = "orange", alpha = 0.2) 

# Create interactive plot 
ggplotly(p) # or run ggplotly() to transform previous plot


car_copy <- select(mtcars, -cyl) 

# ggplot object 
p <- ggplot() +   
  geom_point(data = car_copy, aes(x = mpg, y = disp),   
             color = "lightgrey") + 
  geom_point(data = mtcars, aes(x = mpg, y = disp)) +  
  facet_grid( ~ cyl) +   
  ggtitle("MPG vs Displacement By Number of Cylinders") +  
  xlab("Miles per Gallon") +  
  ylab("Displacement") 

# Create interactive plot 
ggplotly(p)

# Assign the interactive plot using `ggplotly` to
# a variable
fig <- ggplotly(p)
fig

# Now we can pipe this object to set other customisations, e.g.
fig %>% 
  layout(
    yaxis = list(range = c(100, 400))
  )
fig

# INTEGRATION WITH SHINY

library(shiny)

ui <- fluidPage(
  textOutput("text"),
  
  # plotly output widget
  plotlyOutput("plot")
)

server <- function(input, output){
  output$text <- renderText({
    "This is an interative plot within a Shiny app:"
  })
  
  # Render interactive plotly chart
  output$plot <- renderPlotly({
    mtcars %>% 
      plot_ly(x = ~factor(cyl), y = ~mpg, type = "scatter", name = "Scatter") %>% 
      add_boxplot(name = "Boxplot")
  })
}

shinyApp(ui = ui, server = server)