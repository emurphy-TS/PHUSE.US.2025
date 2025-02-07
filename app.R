library(shiny)

# Define UI for the application
ui <- fluidPage(
  titlePanel("Simple Addition App"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num1", "Enter first number:", value = 0),
      numericInput("num2", "Enter second number:", value = 0),
      actionButton("add_btn", "Add Numbers")
    ),
    mainPanel(
      h3("Result:"),
      verbatimTextOutput("sum")
    )
  )
)

# Define server logic
server <- function(input, output) {
  sum_result <- reactive({
    input$add_btn  # React when button is clicked
    isolate(input$num1 + input$num2)
  })

  output$sum <- renderText({
    sum_result()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
