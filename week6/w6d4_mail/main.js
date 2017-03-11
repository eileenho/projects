const Router = require("./router");

document.addEventListener('DOMContentLoaded', () => {
  let content = document.querySelector(".content");
  let router = new Router(content);
  router.start();
  let listItems = Array.from(document.querySelectorAll(".sidebar-nav li"));
    listItems.forEach( (li) => {
      li.addEventListener("click", () => {
        let name = li.innerText.toLowerCase();
        window.location.hash = name;
    });
  });
});
