function myUniq(array) {
  const uniqArray = [];

  array.forEach(function(num) {
    if (!uniqArray.includes(num)) {
      uniqArray.push(num);
    }
  });

  return uniqArray;
}

// console.log(myUniq([1,2,1,3,3]));

function twoSum(array) {
  const positions = [];
  let i = 0;
  while (i < array.length) {
    let j = i + 1;
    while (j < array.length) {
      if (array[i] + array[j] === 0) {
        positions.push([i, j]);
      }
      j++;
    }
    i++;
  }
  return positions;
}

// console.log(twoSum([-1, 0, 2, -2, 1]));

function myTranspose(array) {
  const transposed = [];
  for (let i = 0; i < array.length; i++) {
    let shortArray = [];
    for (let j = 0; j < array.length; j++) {
      shortArray.push(array[j][i]);
    }
    transposed.push(shortArray);
  }
  return transposed;
}

// console.log(myTranspose([[0, 1, 2],[3, 4, 5],[6, 7, 8]]));


Array.prototype.myEach = function(func) {
  for(let i = 0; i < this.length; i++) {
    func(this[i]);
  }
  return this;
};
//
// console.log([1,2,3].myEach(function(num){
//     console.log(num);
// }));

Array.prototype.myMap = function(func) {
  const mapped = [];
  // this.myEach(element => mapped.push(func(element)) );
  for(let i = 0; i < this.length; i++) {
    mapped.push(func(this[i]));
  }
  return mapped;
};

// console.log([1,2,3].myMap( num => num * num ));
//
// console.log([1,2,3].myMap(function(num){
//  return num * num;
// }));

Array.prototype.mySelect = function(func) {
  let selected = [];
    this.myEach( function(element) {
      if (func(element) === true){
        selected.push(element);
    }
  });
  return selected;
};

// console.log([1,2,3].mySelect(num => num % 2 === 0));

Array.prototype.myInject = function(func) {
  let injected = 0;
    this.myEach( function(element) {
      injected += element;
    });
  return injected;
};

// console.log([1,2,3].myInject());

function bubbleSort(array) {
  let sorted = false;
  let i = 0;
  while (i < array.length && sorted === false) {
    sorted = true;
    let j = i + 1;
    while (j < array.length) {
      if (array[i] > array[j]) {
        [array[i], array[j]] = [array[j], array[i]];
        sorted = false;
      }
      j++;
    }
    i++;
  }
  return array;
}

// console.log(bubbleSort([4,3,1,2]));

function subString(word) {
  let substring = [];
  let i = 0;
  while (i < word.length + 1) {
    let j = i + 1;
    while (j < word.length + 1) {
      substring.push(word.slice(i, j));
      j++;
    }
    i++;
  }
  return substring;
}

// console.log(subString("cat"));

function range(start, end) {
  if (end < start) {
    return [];
  }
  return (range(start, (end - 1)).concat([end]));
}

// console.log(range(1, 5));

function sum(array) {
  return array.myInject();
}

// console.log(sum([1, 3, 5, 6]));

function sumRecursive(array) {
  if (array.length === 1) {
    return array[0];
  }
  return array[0] + sumRecursive(array.slice(1, array.length + 1));
}

// console.log(sumRecursive([1, 3, 5, 6]));

function Exponent(base, exponent) {
  if (exponent === 0) {
    return 1;
  } else if (exponent === 1) {
    return base;
  }

  return base * Exponent(base, exponent - 1);
}

// console.log(Exponent(2, 3));

function Fibonacci(n) {
  if (n <= 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  }

  let fib = Fibonacci(n-1);
  return fib.concat([fib[fib.length - 1] + fib[fib.length - 2]]);
}

// console.log(Fibonacci(5));

function binarySearch(array, target) {
  if (array.length === 0) {
    return null;
  } else if(array.length === 1 && array[0] !== target) {
    return null;
  }
  let mid = Math.floor(array.length / 2);
  if (array[mid] === target) {
    return mid;
  } else if (target < array[mid]) {
    let left = array.slice(0, mid);
    return binarySearch(left, target);
  } else {
    let right = array.slice(mid + 1);
    const subproblem = binarySearch(right, target);
    return subproblem === -1 ? -1 : subproblem + mid + 1;
  }
}

// console.log(binarySearch([1, 2, 4, 6, 7, 8], 7));

//constructors
function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  return `${this.owner} loves ${this.name}`;
};

Cat.prototype.cuteStatement = function() {
  return `Everyone loves ${this.name}`;
};

Cat.prototype.meow = function() {
  return 'meow.';
};

const cat = new Cat('Sprinkles', 'Angela');

cat.meow = function () {
  return 'purr';
};
