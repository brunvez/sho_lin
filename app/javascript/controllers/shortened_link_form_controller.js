import { Controller } from "stimulus"
import StimulusReflex from 'stimulus_reflex'

export default class extends Controller {
  static targets = ['name', 'shortenedPath', 'originalUrl']

  connect() {
    StimulusReflex.register(this)
  }

  closeModal() {
    this.stimulate('ShortenedLinkFormReflex#close_modal')
  }

  trapClick(e) {
    e.stopPropagation()
  }

  handleKeyDown(e) {
    if (e.key === 'Escape') {
      this.closeModal()
    }
  }

  validate(e) {
    this.stimulate('ShortenedLinkFormReflex#validate', [e.target], this.shortenedLinkParams)
  }

  save(e) {
    this.stimulate('ShortenedLinkFormReflex#save', [e.target], this.shortenedLinkParams)
  }

  get shortenedLinkId() {
    const id = parseInt(this.data.get('linkId'), 10)
    return isNaN(id) ? null : id
  }

  get shortenedLinkParams() {
    return {
      id: this.shortenedLinkId,
      shortened_link: {
        name: this.nameTarget.value,
        shortened_path: this.shortenedPathTarget.value,
        original_url: this.originalUrlTarget.value
      }
    }
  }
}
