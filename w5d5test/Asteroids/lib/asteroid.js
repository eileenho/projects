const Util = require("./util");
const MovingObject = require("./moving_object");

function Asteroid(ast_pos) {
  this.COLOR = "#FF00B2";
  this.RADIUS = 5;
  this.VEL = randomVec(10);
  let options = {pos: ast_pos, color: this.COLOR, radius: this.RADIUS, vel: this.VEL};
  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

// Return a randomly oriented vector with the given length.
function randomVec(length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
}
// Scale the length of a vector by the given amount.
function scale(vec, m) {
  return [vec[0] * m, vec[1] * m];
}

module.exports = Asteroid;
