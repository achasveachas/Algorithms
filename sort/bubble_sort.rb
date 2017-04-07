# Bubble sort is a sorting algorithm where we repeatedly iterate through an array, comparing every 2 elements, and swapping them if they are unordered.
# We keep doing this until the entire array is sorted.

# First let's define a method to swap any two elements of an array
def swap(array, first_index, second_index)
  first_item = array[first_index]
  array[first_index] = array[second_index]
  array[second_index] = first_item
  array
end


def bubble_sort(array)
  # We set a control array, so that we can compare if the array after this pass is the same as the array after last pass,
  # if it is we know the array is fully sorted
  control_array = []

  until control_array == array
    # we set the value of the control array to the result of last iteration
    control_array = array.dup
    # We iterate through the array, and compare every adjacent pair of indexes, swaping them if the second one is smaller than the first.
    array.each_index do |i|
      swap(array, i, i + 1) if array[i + 1] && array[i] > array[i + 1]
    end
  end
  # At the end of it all we return the sorted array
  array
end
