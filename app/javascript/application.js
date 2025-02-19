// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"
import "ahoy"

document.addEventListener('turbo:load', () => {
  document.querySelectorAll('.targetValueChange').forEach(link => {
    link.addEventListener('click', (event) => {
      event.preventDefault()

      const target = document.querySelector(link.getAttribute('data-target'))
      target.value = link.getAttribute('data-value')
    })
  })

  ahoy.trackClicks(".ahoyClick");
})

document.addEventListener("trix-before-initialize", (event) => {
  
  Trix.config.blockAttributes.heading2 = {
    tagName: "h2",
    terminal: true,      // no nested blocks
    breakOnReturn: true, // create a new block on Enter
    group: false
  };
  
  Trix.config.blockAttributes.heading3 = {
    tagName: "h3",
    terminal: true,      // no nested blocks
    breakOnReturn: true, // create a new block on Enter
    group: false
  };

  const editor  = event.target;
  const toolbar = editor.toolbarElement;

  var buttonH2       = document.createElement("button");
  buttonH2.type      = "button";
  buttonH2.className = "trix-button";
  buttonH2.setAttribute("data-trix-attribute", "heading2");
  buttonH2.title = "Heading 2";
  buttonH2.textContent = "H2";

  var buttonH3       = document.createElement("button");
  buttonH3.type      = "button";
  buttonH3.className = "trix-button";
  buttonH3.setAttribute("data-trix-attribute", "heading3");
  buttonH3.title = "Heading 3";
  buttonH3.textContent = "H3";

  // Append the button to the block tools group (if it exists)
  const group = toolbar.querySelector(".trix-button-group--block-tools");
  if (group) {
    group.insertBefore(buttonH2, group.children[1]);
    group.insertBefore(buttonH3, group.children[2]);
  }
});
