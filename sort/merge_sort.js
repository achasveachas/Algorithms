function findMinAndRemove(array1, array2){
  let minfirstHalf = array1[0]
  let minsecondHalf = array2[0]

  if(minfirstHalf < minsecondHalf){
    return array1.shift()
  } else {
    return array2.shift()
  }
}

function merge(array1, array2) {
  let sortedArray = []
  let currentMin
  while (array1.length > 0 && array2.length > 0) {
    currentMin = findMinAndRemove(array1, array2)
    sortedArray.push(currentMin)
  }
  return sortedArray.concat(array1).concat(array2)
}

function mergeSort(array) {
  let midpoint = array.length / 2
  let firstHalf = array.slice(0, midpoint)
  let secondHalf = array.slice(midpoint, array.length)
  if (array.length < 2) {
    return array
  } else {
    return merge(mergeSort(firstHalf), mergeSort(secondHalf))
  }
}
