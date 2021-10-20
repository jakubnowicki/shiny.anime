#' trigger_animation
#' 
#' Trigger animation for specified targets
#' 
#' @param session session
#' @param targets css selectors for target elements
#' @param ... arguments passed to anime function; for details check https://animejs.com/documentation
#' @export
#' 
#' @importFrom shiny getDefaultReactiveDomain
#' @examples 
#' \dontrun{
#' library(shiny)
#' library(shiny.anime)
#' 
#' ui <- fluidPage(
#'     use_anime(),
#'     titlePanel("Old Faithful Geyser Data"),
#'     actionButton(
#'                 inputId = "move",
#'                 label = "Move!"
#'             ),
#' 
#'     sidebarLayout(
#'         sidebarPanel(
#'             sliderInput("bins",
#'                         "Number of bins:",
#'                         min = 1,
#'                         max = 50,
#'                         value = 30)
#'         ),
#' 
#'         mainPanel(
#'            plotOutput("distPlot")
#'         )
#'     )
#' )
#' 
#' server <- function(input, output, session) {
#' 
#'     output$distPlot <- renderPlot({
#'         x    <- faithful[, 2]
#'         bins <- seq(min(x), max(x), length.out = input$bins + 1)
#' 
#'         hist(x, breaks = bins, col = 'darkgray', border = 'white')
#'     })
#' 
#'     observeEvent(input$move, {
#'         trigger_animation(
#'             targets = "#distPlot",
#'             translateY = glue::glue("{sample(0:500, 1)}px"),
#'             translateX = glue::glue("{sample(-600:100, 1)}px"),
#'             rotate = list(
#'                 value = glue::glue("{sample(0:360, 1)}deg"),
#'                 duration = 6000
#'             )
#'         )
#'     })
#' }
#' 
#' shinyApp(ui = ui, server = server)
#' 
#' }
trigger_animation <- function(session = getDefaultReactiveDomain(), targets, ...) {
    session$sendCustomMessage(
        "send_animation",
        message = list(
            targets = targets,
            ...
        )
    )
}
