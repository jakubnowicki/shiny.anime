Shiny.addCustomMessageHandler(
    "send_animation",
    function(message) {
        anime({...message})
    }
)
