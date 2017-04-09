# HT Scott Young (https://github.com/SYoung82/linked-lists)

# for singly linked lists see https://github.com/achasveachas/Algorithms/blob/master/data-structures/linked_list.rb

class Node
    attr_accessor :value, :next, :prev

    #Node.new(value), creates a new Node object
    #Returns new Node obj, with a value
    def initialize(value = "")
        @value = value
    end

    #node.to_str(), returns string representation of node
    def to_str()
        "Node::  value - #{self.value}\n   next node - #{self.next || "nil"},\n   prev node - #{self.prev || "nil"}\n"
    end
end


class DoublyLinkedList
    attr_accessor :head

    #DoublyLinkedList.new(head_node), creates a new DoublyLinkedList object
    #Returns new DoublyLinkedList obj whose head points to the first node
    def initialize(head_node = nil)
        @head = head_node
    end

    #link_list.insert_head(new_node)
    #Returns new DoublyLinkedList obj whose head is new_node
    def insert_head(new_node)
        if new_node
            new_node.next = self.head
            self.head = new_node
        end
    end

    #link_list.insert_tail(new_node)
    #Returns new DoublyLinkedList obj whose tail node is new_node
    def insert_tail(new_node)
        current_node = self.head

        while current_node.next != nil
            current_node = current_node.next
        end

        current_node.next = new_node
        new_node.prev = current_node
    end

    #link_list.insert_after(node, new_node)
    #Returns new DoublyLinkedList obj with new_node inserted after node if found
    #    else returns false
    def insert_after(node, new_node)
        current_node = self.head

        while current_node != node && current_node != nil
            current_node = current_node.next
        end

        if current_node && current_node.next
            new_node.next = current_node.next
            current_node.next = new_node
            return self
        elsif current_node
            current_node.next = new_node
            return self
        else
            return false
        end
    end

    #link_list.delete(node)
    #Returns new DoublyLinkedList obj with node removed if found
    def delete(node)
        if node.prev != nil
            node.prev.next = node.next
        else
            self.head = node.next
        end

        if node.next != nil
            node.next.prev = node.prev
        end

        return self
    end

    #link_list.search(value)
    #Returns Node obj whose value = value if found
    def search(value)
        current_node = self.head

        while current_node != nil && current_node.value != value
            current_node = current_node.next
        end

        return current_node
    end

    def tail
      if head
        current_node = head
        until !!current_node && current_node.next == nil
          current_node = current_node.next
        end
        current_node
      end
    end

    #link_list.each do |block|
    #Yields each node in the link_list to block
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
