class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

  def to_str()
      "Node::  value - #{value}, next node - #{(self.next && self.next.value) || "nil"}"
  end
end


class LinkedList
  attr_accessor :head

  # Class methods

  def initialize(node = nil)
    @head = node
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

  # Prints a string representation of link_list
  def to_str
    each do |node|
      puts node.to_str()
    end
  end

  # Returns the last node in the list
  def tail
    if head

      current_node = head

      until !!current_node && current_node.next == nil
        current_node = current_node.next
      end

      current_node
    end
  end

  # Returns the number of nodes in the list
  def length
    length = 0
    each{ length += 1}
    length
  end

  # Returns true if the list contains a node with given value
  def contains?(value)
    contains = false
    each do |node|
      contains = true if node.value == value
    end
    contains
  end

  # Returns a node if the list contains a node with given value
  def find(value)
    each do |node|
      return node if node.value == value
    end
    nil
  end

  # Returns the node immediately preceding the node with a given value
  def find_before(value)
    before = nil
    each do |node|
      before = node if node.next && node.next.value == value
    end
    before
  end

  # Methods to add to the list

  # Adds a node to the head of the list (redfining the head in the process)
  def add_to_head(node)
    if contains?(node.value)
      puts "Sorry, a node with value #{node.value} already exists"
    else
      node.next = head
      self.head = node
      puts "Node #{node.value} was added to the head of the list"
    end
    to_str
  end

  # Add a node after a node with given value (if no value (or invalid value) is given, the node will be added to the tail of the list)
  def add(node, value = nil)

    if value && !self.contains?(value)
      # Make sure the value you want to insert after exists, otherwise we will add it to the tail
      puts "Sorry, a node with value #{value} does not exist, the node will be added to the end of the list"
      value = nil
    end

    # First make sure we don't already have a node with that value
    if self.contains?(node.value)
      puts "Sorry, a node with value #{node.value} already exists"
    elsif length == 0
      # If it's an empty list, the added node becomes head
      self.head = node
    elsif value == nil
      # If we're adding to the tail we don't need to set node.next
      tail.next = node
    else
      before_insert = find(value)
      node.next = before_insert.next
      before_insert.next = node
    end
    to_str
  end

  # Methods to remove from list

  # Removes the node with the given value, if no value is given the tail will be removed
  def remove(value = tail.value)

    # first we want to make sure we have a node with that value
    if !contains?(value)
      puts "Couldn't find a node with value #{value}"
      return to_str
    end

    # Next check if we're removing the head (as that would require we define head.next as the new head)
    if head.value == value
      self.head = self.head.next
      return puts "The Head Node with value '#{value}' has been removed"
    end

    # Find the node before the one we want to remove
    before_remove = find_before(value)

    to_remove = before_remove.next
    before_remove.next = to_remove.next
    puts "Node with value '#{value}' has been removed"
  end

  # Methods to manipulate the list

  def reverse
    reversed_list = LinkedList.new
    each do |node|
      reversed_list.add_to_head(Node.new(node.value))
    end
    reversed_list
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
