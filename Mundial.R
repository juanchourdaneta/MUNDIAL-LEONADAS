library(shiny)

# 1. Interfaz de Usuario (UI)
ui <- fluidPage(
  titlePanel("Mi Primera Shiny App en GitHub"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Número de barras:", min = 1, max = 50, value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# 2. Lógica del Servidor (Server)
server <- function(input, output) {
  # Cambia la barra / por el signo $ justo aquí:
  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}


# 3. Ejecutar la Aplicación
shinyApp(ui = ui, server = server)