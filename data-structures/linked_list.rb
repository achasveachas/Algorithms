class Node
  attr_accessor :value, :next

  def initialize(value = '')
    @value = value
  end

  def to_str()
      "Node::  value - #{self.value}, next node - #{self.next || "nil"}"
  end
end


class LinkedList
  attr_accessor :head

  def initialize(node)
    @head = node
  end

  def tail
    current_node = self.head

    until current_node.next == nil
      current_node = current_node.next
    end

    current_node
  end

  def add_to_head(node)
    node.next = self.head
    self.head = node
    self
  end

  def add_to_tail(node)
    current_tail = self.tail
    current_tail.next = node
    self
  end
end
