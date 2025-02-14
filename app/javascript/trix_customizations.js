document.addEventListener("trix-initialize", function(event) {
  var toolbarElement = event.target.toolbarElement;
  var blockTools = toolbarElement.querySelector(".trix-button-group--block-tools");

  var buttonH2 = document.createElement("button");
  buttonH2.type = "button";
  buttonH2.className = "trix-button";
  buttonH2.setAttribute("data-trix-attribute", "heading2");
  buttonH2.title = "Heading 2";
  buttonH2.textContent = "H2";

  var buttonH3 = document.createElement("button");
  buttonH3.type = "button";
  buttonH3.className = "trix-button";
  buttonH3.setAttribute("data-trix-attribute", "heading3");
  buttonH3.title = "Heading 3";
  buttonH3.textContent = "H3";

  blockTools.appendChild(buttonH2);
  blockTools.appendChild(buttonH3);
});
