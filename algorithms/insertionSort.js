// [x] generate a random array
// [x] accept array as an argument
// [x] select the first element in the array
// [] if the next element is > the next element, increment the item's index
// [x] if the number is less than the element before it, it takes that element's index
// [x] repeat until all numbers have been sorted

var sortMe = [24, 13, 7, 6, 2, 2, 17]
console.log('Unsorted: ' + sortMe)

function insertionSort(array) {
  stop = array.length - 1
  console.log('hello');
  for (var i = 1; i <= stop ; i++) {
    key = array[i]
    console.log('key: ' + key);
    console.log('i:' + i);
    openIndex = i
    console.log('open index: ' + openIndex)
    while (openIndex > 0 && array[openIndex - 1] > key) {
      array[openIndex] = array[openIndex - 1]
      openIndex = openIndex - 1
    }
    array[openIndex] = key
  }
  return array;
}

var sorted = insertionSort(sortMe)

console.log('Sorted: '+ sorted)
