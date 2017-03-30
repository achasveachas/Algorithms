class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

  def to_str()
      "Node::  value - #{self.value}, next node - #{(self.next && self.next.value) || "nil"}"
  end
end


class LinkedList
  attr_accessor :head

  # Class methods

  def initialize(node = Node.new("Head"))
    @head = node
  end

  # Prints a string representation of link_list
  def to_str
    self.each do |node|
      puts node.to_str()
    end
  end

  # Creates a sample list with 11 nodes
  def self.seed
    ll = self.new(Node.new(1))
    10.times do |i|
      ll.add(Node.new(i + 2))
    end
    ll
  end

  # Methods to get information about the list

  # Returns the last node in the list
  def tail
    current_node = self.head

    until current_node.next == nil
      current_node = current_node.next
    end

    current_node
  end

  # Returns the number of nodes in the list
  def length
    length = 0
    self.each{ length += 1}
    length
  end

  # Returns true if the list contains a node with given value
  def contains?(value)
    contains = false
    self.each do |node|
      contains = true if node.value == value
    end
    contains
  end

  # Returns a node if the list contains a node with given value
  def find(value)
    found_node = nil
    self.each do |node|
      if node.value == value
        return node
      end
    end
    found_node
  end

  # Methods to add to the list

  # Adds a node to the head of the list (redfining the head in the process)
  def add_to_head(node)
    if self.contains?(node.value)
      puts "Sorry, a node with value #{node.value} already exists"
    else
      node.next = self.head
      self.head = node
      puts "Node #{node.value} was added to the head of the list"
    end
    self.to_str
  end

  # Add a node after a node with given value (if no value (or invalid value) is given, the node will be added to the tail of the list)
  def add(node, value = self.tail.value)

    if !self.contains?(value)
      # Make sure the value you want to insert after exists, otherwise we will add it to the tail
      puts "Sorry, a node with value #{value} does not exist, the node will be added to the end of the list"
      value = self.tail.value
    end

    # First make sure we don't already have a node with that value
    if self.contains?(node.value)
      puts "Sorry, a node with value #{node.value} already exists"
    elsif value == self.tail.value
      # If we're adding to the tail we don't need to set node.next
      self.tail.next = node
      puts "Node #{node.value} was added to the end of the list"
    else
      before_insert = self.find(value)
      node.next = before_insert.next
      before_insert.next = node
      puts "Node #{node.value} was added to the after Node #{before_insert.value}"
    end
    self.to_str
  end

  # Methods to remove from list

  # Removes the node with the given value
  def remove(value)

    # first we want to make sure we have a node with that value

    if !self.contains?(value)
      puts "Couldn't find a node with value #{value}"
      return self.to_str
    end

    # Next check if we're removing the head (as that would require we define head.next as the new head)
    if self.head.value == value
      self.head = self.head.next
      puts "Removed node with value #{value}"
      return self.to_str
    end

    # Find the node before the one we want to remove
    before_remove = nil
    self.each do |node|
      if node.next && node.next.value == value
        before_remove = node
      end
    end

    to_remove = before_remove.next
    before_remove.next = to_remove.next
    puts "Node with value #{to_remove.value} has been removed"
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

end
