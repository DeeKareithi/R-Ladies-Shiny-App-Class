#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
#Author: Dorcas Kareithi
#Created: December 2020
#Last updated: December 2020
#Task: Create a Shiny App to explore the spread of COVID in Kenya
#


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
library(geojsonio)


#Temporary: ALready downloaded the data so we may not need to use this chunck
#We may need to install one more library (changed the dataset last minute when I found out that Twotter is blocked in the country I am currently at and wanted to do a live dashboard)
#Installing the tidy covid 19 package

#Install tidycovid package
#remotes::install_github("joachim-gassen/tidycovid19")

library(tidycovid19)
library(tidyverse)



#Data Preparation
#1. Download the data

#download the data
#CovData <- download_jhu_csse_covid19_data()

#write.csv(CovData, "C:\\Users\\Dorcas\\Documents\\GitHub\\R-Ladies-Siny-App-Class\\Data\\covid_data.csv")

#Loading the data
mydata<- read.csv( "C:\\Users\\Dorcas\\Documents\\GitHub\\R-Ladies-Siny-App-Class\\Data\\covid_data.csv")


#we subset the data to get only East Africa
#ea_data<-filter(mydata, country %in% c('Kenya', 'Uganda', "Tanzania", "Rwanda", "Burundi"))

#ea_data<-filter(mydata, country %in% c('Kenya'))


#check the data
head(ea_data)
tail(ea_data)

#We are now going to create simple comarative 


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
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
))
       #Just a decription of the dashboard

