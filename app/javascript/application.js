// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"


document.addEventListener('turbo:load', () => {
  document.querySelectorAll('.targetValueChange').forEach(link => {
    link.addEventListener('click', (event) => {
      event.preventDefault()

      const target = document.querySelector(link.getAttribute('data-target'))
      target.value = link.getAttribute('data-value')
    })
  })
})
