library(shiny)
library(shiny.anime)

ui <- fluidPage(
    use_anime(),
    actionButton(
        "move",
        "Move"
    )
)

server <- function(input, output, session) {
    position <- reactiveVal(0)

    observeEvent(input$move, {
        movement <- position() + 30

        if (movement >= 200) {
            movement <- 0
        }

        position(movement)

        trigger_animation(
            targets = "#move",
            translateX = paste0(movement, "px")
        )
    })
}

shinyApp(ui = ui, server = server)
