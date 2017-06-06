function findMinAndRemove(array){
  let min = 0
  for (var i = 0; i < array.length; i++) {
    if (array[i] < array[min]) {
      min = i
    }
  }
  return array.splice(min, 1)[0]
}

function insertionSort(array){
  let sortedArray = []
  while (array.length > 0) {
    sortedArray.push(findMinAndRemove(array))
  }
  return sortedArray
}
