function swap(array, firstIndex, secondIndex) {
  var firstItem = array[firstIndex]
  array[firstIndex] = array[secondIndex]
  array[secondIndex] = firstItem
  return array
}

function findIndexOfMinimumValue(array, index) {
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

function selectionSort(array) {
  for (var i = 0; i < array.length; i++) {
    var minimumIndex = findIndexOfMinimumValue(array, i)
    swap(array, i, minimumIndex)
  }

  return array
}
