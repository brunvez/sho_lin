import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

export default class extends Controller {
  connect() {
    StimulusReflex.register(this)
  }

  newLink() {
    this.stimulate('ShortenedLinksReflex#new')
  }

  editLink(e) {
    const linkId = parseInt(e.target.dataset.linkId)
    this.stimulate('ShortenedLinksReflex#edit', linkId)
  }

  destroyLink(e) {
    if (confirm('Are you sure you want to remove this link?')) {
      const linkId = parseInt(e.target.dataset.linkId, 10)
      this.stimulate('ShortenedLinksReflex#destroy', linkId)
    }
  }
}
