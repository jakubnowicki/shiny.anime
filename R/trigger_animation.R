#' trigger_animation
#' 
#' Trigger animation for specified targets
#' 
#' @param session session
#' @param targets css selectors for target elements
#' @param ... arguments passed to anime function; for details check https://animejs.com/documentation
#' @export
trigger_animation <- function(session, targets, ...) {
    session$sendCustomMessage(
        "send_animation",
        message = list(
            targets = targets,
            ...
        )
    )
}
