#This is the server part ofthe app. Here you give instructions to the UI and perfoem data operations


# Define server logic required to produce the various output we want displayed
shinyServer(function(input, output) {

output$countries_plot <- renderPlot({
    
    filtered <- ea_data %>%
        filter(
            country == input$countryInput
            
            )
      
      ggplot(filtered, aes(x = date, y = deaths)) +
      geom_line() +
      geom_point() +
      labs(y = "deaths")
    })
})

