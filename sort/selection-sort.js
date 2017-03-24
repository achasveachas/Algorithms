const swap = function(array, firstIndex, secondIndex) {
  var firstItem = array[firstIndex]
  array[firstIndex] = array[secondIndex]
  array[secondIndex] = firstItem
  return array
}

const findIndexOfMinimumValue = function(array, index) {
  let minimumValue = array[index]
  let minimumIndex = index;

  for (var i = index + 1; i < array.length; i++) {
    if (array[i] < minimumValue) {
      minimumValue = array[i]
      minimumIndex = i
    }
  }

  return minimumIndex
}

const selectionSort = function(array) {
  sortedArray = array
  for (var i = 0; i < array.length; i++) {
    var minimumIndex = findIndexOfMinimumValue(sortedArray, i)
    swap(sortedArray, i, minimumIndex)
  }

  return sortedArray
}
