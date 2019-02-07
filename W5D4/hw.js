function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb, adj, noun){
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`)}
// madLib('make', 'best', 'guac');

function isSubstring(searchString, subString){
  return searchString.includes(subString);
}

// console.log(isSubstring("time to program", "time"));


function fizzBuzz(array){
  let fizzBuzz = [];
  for(let i = 0; i < array.length; i++){
    if (array[i] % 3 === 0 && array[i] % 5 === 0){
      continue;
    } else if (array[i] % 3 === 0 || array[i] % 5 === 0){
      fizzBuzz.push(array[i]);
    } else {
      continue;
    }
  }
  return fizzBuzz;
}

function isPrime(number){
  for(let i = 2, sqroot = Math.sqrt(number); i <= sqroot; i++)
    if(number % i === 0) return false;
  return number !== 1 && number !== 0;
}

// console.log(fizzBuzz([3,4,5,7,10,15]))

console.log(isPrime(133));

//argument => expression; // equal to (argument) => { return expression };


function firstNPrimes(n){
  let primes = [];
  let i = 2;
  while(n > 0){
    if (isPrime(i)){
      primes.push(i);
      n -= 1;
    }
    i += 1;
  }
  return primes;
}
console.log(firstNPrimes(5))

const sumOfNPrimes = num => firstNPrimes(num).reduce((a,b) => a + b, 0);
console.log(sumOfNPrimes(5));













