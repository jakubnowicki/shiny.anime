#' use_anime
#'
#' Use anime js in the application
#'
#' @export
#' 
#' @importFrom htmltools htmlDependency
#' 
#' @examples 
#' \dontrun{
#' library(shiny)
#' library(shiny.anime)
#' 
#' ui <- fluidPage(
#'     use_anime(),
#'     actionButton(
#'         "move",
#'         "Move"
#'     )
#' )
#' 
#' server <- function(input, output, session) {
#'     position <- reactiveVal(0)
#' 
#'     observeEvent(input$move, {
#'         movement <- position() + 30
#' 
#'         if (movement >= 200) {
#'             movement <- 0
#'         }
#' 
#'         position(movement)
#' 
#'         trigger_animation(
#'             targets = "#move",
#'             translateX = paste0(movement, "px")
#'         )
#'     })
#' }
#' 
#' shinyApp(ui = ui, server = server)
#' }
use_anime <- function() {
  htmlDependency(
    name = "anime.js",
    version = "3.2.1",
    package = "shiny.anime",
    src = "assets",
    script = c("anime.min.js", "animate.js")
  )
}
