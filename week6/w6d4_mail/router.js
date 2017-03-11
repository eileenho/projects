class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();
    document.addEventListener("hashChange", () => {
      this.render();
    });
  }

  render() {
    this.node.innerHTML = "";
    let route = this.activeRoute();
    let p = document.createElement("p");
    p.innerHTML = route;
    this.node.appendChild(p);
  }

  activeRoute() {
    let route = window.location.hash;
    return route.slice(1);
  }
}

module.exports = Router;
