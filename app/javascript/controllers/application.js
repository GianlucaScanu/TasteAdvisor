import { Application } from "@hotwired/stimulus"

//require("@rails/activestorage").start()

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
