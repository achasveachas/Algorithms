#for this to work, array must be a sorted list

def binary_search(array, number)
  #number is the number you are searching for in the array
  min = 0
  max = array.length - 1
  # min..max is the range we are looking through at any given time,
  # as we loop and rule out more and more of the array, the range gets smaller and smaller

  while min <= max
  # if the number is not in the array, eventually min will be greater than max
  # which will break loop
  index_guess = (min + ((max - min) / 2)).floor # the average of min and max
    if array[index_guess] == number
      return "#{number} is in this array in index position #{index_guess}."
    elsif array[index_guess] > number
      max = index_guess - 1
    else
      min = index_guess + 1
    end
  end
  return "Number not in this array"
end
