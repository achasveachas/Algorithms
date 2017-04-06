# Breadth First is a search algorithm for searching through nested structures.
# It works by searching through the "breadth" of the top layer before digging to the "depth" of the next layer and so on...
# By contrast Depth First digs down into each element as it finds it before moving on to the next one.

def breadth_first(enumerable, value)

    # First we'll initiate an empty array, into which we will push any children of elements that have children
    current_search = enumerable
    next_search = []


    until current_search.empty?
      current_search.each do |element|
        # If the element has children we will push all the children into next_search
        if element.respond_to?('each')
          element.each do |child|
            next_search << child
          end
        # If not we will check if it's equal to the value we are searching for
        elsif element == value
          return element
        end
      end
      # Once we make it through all of the elements we will go on to search through the next level
      # and set a new next_search for the level after that.
      # If none of the elements in the last iteration had children, current_searchwill be set to an empty array, and that will break the loop
      current_search = next_search
      next_search = []
    end
    # If nothing was found, return false
    false
end
