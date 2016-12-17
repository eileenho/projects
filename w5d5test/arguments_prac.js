function sum() {
  const args = Array.prototype.slice.call(arguments);
  let sums = 0;
  args.forEach((el) => {
    sums += el;
  });
  return sums;
}

// console.log(sum(1, 2, 3, 4, 5));

function sumRest(...args) {
  let sums = 0;
  args.forEach((el) => {
    sums += el;
  });
  return sums;
}

// console.log(sumRest(1, 2, 3, 4, 5));

Function.prototype.myBind = function(context, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(context, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBindArg = function(context) {
  const bindArgs = Array.prototype.slice.call(arguments, 1);
  const that = this;
  return function() {
    const callArgs = Array.prototype.slice.call(arguments);
    return that.apply(context, bindArgs.concat(callArgs));
  };
};

function curriedSum(numArgs) {
  let numbers = [];
  return function _curriedSum(number) {
    numbers.push(number);
    if (numbers.length === numArgs) {
      let cSum = sum(...numbers);
      return cSum;
    } else {
      return _curriedSum;
    }
  };
}

// const answer = curriedSum(4);
// console.log(answer(5)(6)(3)(7));

Function.prototype.myCurry = function(numArgs) {
  const functionThis = this;
  let funcArgs = [];
  return function curriedFunction(arg) {
    funcArgs.push(arg);
    if (funcArgs.length === numArgs) {
      //return functionThis(...funcArgs);
      return functionThis.apply(null,funcArgs);
    } else {
      return curriedFunction;
    }
  };
};

const answer = sum.myCurry(4);
console.log(answer(5)(6)(3)(7));
