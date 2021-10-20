#' use_anime
#'
#' Use anime js in the application
#'
#' @export
#' 
#' @importFrom htmltools htmlDependency
use_anime <- function() {
  htmlDependency(
    name = "anime.js",
    version = "3.2.1",
    package = "shiny.anime",
    src = "assets",
    script = c("anime.min.js", "animate.js")
  )
}
