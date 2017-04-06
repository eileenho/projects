let row = "";
for (let i = 0; row.length < 7; i++) {
  row += "#";
  console.log(row);
}

for (let i = 1; i < 101; i++) {
  if (i % 3 === 0 && i % 5 === 0) {
    console.log("fizz buzz");
  } else if (i % 3 === 0) {
    console.log("fizz");
  } else if (i % 5 === 0) {
    console.log("buzz");
  } else {
    console.log(i);
  }
}

//yikes this is clunky!
let board = "";
for (let i = 0; i < 8; i++) {
  if (i % 2 === 0) {
    for (let j = 0; j < 8; j++) {
      if (j > 0 && j % 7 === 0) {
        board += " \n";
      } else if (j % 2 === 0) {
        board += "#";
      } else {
        board += " ";
      }
    }
  } else {
    for (let k = 0; k < 8; k++) {
      if (k > 0 && k % 7 === 0) {
        board += "#\n";
      } else if (k % 2 === 0) {
        board += " ";
      } else {
        board += "#";
      }
    }
  }
}

console.log(board);
