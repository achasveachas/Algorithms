# Selection Sort is an algorithm that sorts an unordered array by finding the lowest value and swapping it for index 0, then finding the second lowest value and swapping it with index 1 etc. until the whole array is sorted.

# First let's define a method to swap any two elements of an array
def swap(array, first_index, second_index)
  first_item = array[first_index]
  array[first_index] = array[second_index]
  array[second_index] = first_item
  array
end

# Next let's define a method for finding the smallest value in a subset of an array starting at a given index
# The reason being that after we put the smallest value in the first index we only want to look at the array starting at the second index and so on
def find_min_index(array, i)
  min_index = i
  until i == array.length - 1
    i += 1
    min_index = i if array[i] < array[min_index]
  end
  min_index
end

# Finally let's iterate through the array, each time we iterate we will swap the nth index with the smallest value looking from the nth index till the end
# After we finish iterating we will return the sorted array.
def selection_sort(array)
  array.length.times do |i|
    swap(array, i, find_min_index(array, i))
  end
  array
end
