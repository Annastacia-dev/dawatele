import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["slides"]

  connect() {
    this.slidesTarget.scrollTo(0, 0)
  }

  next() {
    this.slidesTarget.scrollBy(300, 0)
  }

  prev() {
    this.slidesTarget.scrollBy(-300, 0)
  }
}
