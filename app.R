#Author: Dorcas Kareithi
#Created: December 2020
#Last updated: December 2020
#Task: Create a Shiny App to explore the spread of COVID in East Africa

#http://shiny.rstudio.com/

#Libraries we will need

library(shiny)
library(ggplot2)
library(plyr)
library(dplyr)
library(shinyWidgets)
library(RColorBrewer)
library(plotly)
library(leaflet)
library(readxl)
library(shinythemes)


#Load the data we dowonloaded before

mydata<- read.csv( "C:\\Users\\Dorcas\\Documents\\GitHub\\R-Ladies-Siny-App-Class\\Data\\covid_data.csv")

ea_data<-filter(mydata, country %in% c('Kenya', 'Uganda', "Tanzania", "Rwanda", "Burundi"))

head(ea_data)
tail(ea_data)

View(ea_data)


# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("Kenya COVID Cases Data"),
    
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("CountryInput",
                        "Country:",
                        choices = c("Kenya", 'Uganda', "Tanzania", "Rwanda", "Burundi")),
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            
            plotOutput("countries_plot"),
            br(), br(),
            
            
            
            
            
        )
    )
)



# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$countries_plot <-renderPlot({
        
        filtered <-ea_data %>% filter(
            country== input$CountryInput
                )
    
        ggplot(filtered, aes(x=date, y=deaths)) + geom_line() +geom_point() + labs(y= "Deaths")
        
        }
        
    )

}

# Run the application 
shinyApp(ui = ui, server = server)
