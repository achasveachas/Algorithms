class Node
  attr_accessor :value, :next

  def initialize(value = '')
    self.value = value
  end

  def to_str()
      "Node::  value - #{self.value}, next node - #{self.next || "nil"}"
  end
end


class LinkedList

end
