library("shiny")
library("palmerpenguins")
library("ggplot2")

ui <- fluidPage(

  titlePanel("Palmer Penguins Data"),

  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
        "species",
        "Species:",
        choices = c("Adelie", "Gentoo", "Chinstrap"),
        selected = c("Adelie", "Gentoo", "Chinstrap")
      )
    ),

    mainPanel(
      plotOutput("penguin_plot")
    )
  )
)

server <- function(input, output) {
  penguin_data <- reactive({
    penguins[penguins$species %in% input$species, ]
  })

  output$penguin_plot <- renderPlot({
    ggplot(data = penguin_data(), aes(x = flipper_length_mm, y = body_mass_g)) +
      geom_point(aes(color = species), size = 3) +
      scale_color_manual(values = c("Gentoo" = "darkorange", "Adelie" = "darkorchid", "Chinstrap" = "cyan4")) +
      xlim(c(170, 240)) +
      ylim(c(2500, 6200)) +
      labs(x = "Flipper length (mm)", y = "Body mass (g)", colour = "Species") +
      theme_grey(base_size = 18) +
      theme(legend.position = "bottom")

  })
}

shinyApp(ui = ui, server = server)
