// Function.prototype.myInherits = function(parentObject) {
//   function Surrogate() {}
//   Surrogate.prototype = parentObject.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };

Function.prototype.myInherits = function(parentClass) {
  function Surrogate() {}
  Surrogate.prototype = parentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject () {}

function Ship () {}
Ship.myInherits(MovingObject);

function Asteroid () {}
Asteroid.myInherits(MovingObject);

MovingObject.prototype.moves = function() {
  console.log("moving...");
};

// console.log();

//inherits parent methods
const starShip = new Ship();
// starShip.moves();

Asteroid.prototype.explode = function() {
  console.log("exploding!");
};
//adding to asteroids doesn't change starship
// starShip.explode();

//adding to asteroids doesn't change parent MovingObject

// const movingThing = new MovingObject();
// movingThing.explode();
console.log(typeof starShip.prototype);
console.log(starShip.prototype instanceof MovingObject);
console.log(starShip instanceof MovingObject);
