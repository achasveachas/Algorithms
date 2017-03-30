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

  #class methods

  def initialize(node)
    @head = node
  end

  def self.seed
    ll = self.new(Node.new(1))
    10.times do |i|
      ll.add(Node.new(i + 2))
    end
    ll
  end

  #methods to get information about the list

  def tail
    current_node = self.head

    until current_node.next == nil
      current_node = current_node.next
    end

    current_node
  end

  def length
    length = 0
    self.each{ length += 1}
    length
  end

  def find(value)
    found = false
    self.each do |node|
      found = true if node.value == value
    end
    found
  end

  #methods to add to the list

  def add_to_head(node)
    if self.find(node.value)
      puts "Sorry, a node with value #{node.value} already exists"
    else
      node.next = self.head
      self.head = node
      puts "Node #{node.value} was added to the head of the list"
    end
    self.to_str
  end

  def add(node)
    if self.find(node.value)
      puts "Sorry, a node with value #{node.value} already exists"
    else
      self.tail.next = node
      puts "Node #{node.value} was added to the list"
    end
    self.to_str
  end

  #methods to remove from list

  def remove(value)
    if self.head.value == value
      self.head = self.head.next
      puts "Removed node with value #{value}"
      return self.to_str
    end

    before_remove = nil
    self.each do |node|
      if node.next && node.next.value == value
        before_remove = node
      end
    end
    if !before_remove
      puts "Couldn't find a node with value #{value}"
    else
      to_remove = before_remove.next
      before_remove.next = to_remove.next
      puts "Node with value #{to_remove.value} has been removed"
    end
    self.to_str
  end

  #iterators

  def each(&block)
      current_node = self.head
      while current_node != nil
          yield current_node
          current_node = current_node.next
      end
  end

  #link_list.to_str()
  #Prints a string representation of link_list
  def to_str
      self.each do |node|
          puts node.to_str()
      end
  end
end
