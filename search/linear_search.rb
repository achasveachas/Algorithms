# Linear search is the simplest way to search, like for real, you just go through the damn thing and compare each element...

def linear_search(enumerable, value)

  enumerable.each do |element|
    return  element if element == value
  end

  false
end
