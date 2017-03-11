const Asteroid = require("./asteroid");

function Game() {
  this.DIM_X = 200;
  this.DIM_Y = 200;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  let asteroids = [];
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    const newAsteroid = new Asteroid(this.randomPosition());
    asteroids.push(newAsteroid);
  }
  return asteroids;
};

Game.prototype.randomPosition = function() {
  const x = Math.floor(Math.random() * this.DIM_X);
  const y = Math.floor(Math.random() * this.DIM_Y);
  return [x, y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect();
  this.asteroids.forEach(el {
    el.draw;
  )};


};

Game.prototype.moveObjects = function() {
};
