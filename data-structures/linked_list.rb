class Node
  attr_accessor :value, :next

  def initialize(value = '')
    @value = value
  end

  def to_str()
      "Node::  value - #{self.value}, next node - #{(self.next && self.next.value) || "nil"}"
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

  def add(node)
    self.tail.next = node
    self
  end

  def length
    length = 0
    self.each do
      length += 1
    end
    length
  end

  def each(&block)
      current_node = self.head
      while current_node != nil
          yield current_node
          current_node = current_node.next
      end
  end

  #link_list.to_str()
  #Prints a string representation of link_list
  def to_str()
      self.each do |node|
          puts node.to_str()
      end
  end
end
