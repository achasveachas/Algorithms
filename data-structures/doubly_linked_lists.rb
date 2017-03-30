# HT Scott Young (https://github.com/SYoung82/linked-lists)
# note: this was originally called LinkedList even though it describes a doubly linked liest,
# I changed all references in the code, but the comments still contain references to LinkedList

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

    #LinkedList.new(headNode), creates a new LinkedList object
    #Returns new LinkedList obj whose head points to the first node
    def initialize(headNode = nil)
        @head = headNode
    end

    #link_list.insertHead(newNode)
    #Returns new LinkedList obj whose head is newNode
    def insertHead(newNode)
        if newNode
            newNode.next = self.head
            self.head = newNode
        end
    end

    #link_list.insertTail(newNode)
    #Returns new LinkedList obj whose tail node is newNode
    def insertTail(newNode)
        currentNode = self.head

        while currentNode.next != nil
            currentNode = currentNode.next
        end

        currentNode.next = newNode
        newNode.prev = currentNode
    end

    #link_list.insertAfter(node, newNode)
    #Returns new LinkedList obj with newNode inserted after node if found
    #    else returns false
    def insertAfter(node, newNode)
        currentNode = self.head

        while currentNode != node && currentNode != nil
            currentNode = currentNode.next
        end

        if currentNode && currentNode.next
            newNode.next = currentNode.next
            currentNode.next = newNode
            return self
        elsif currentNode
            currentNode.next = newNode
            return self
        else
            return false
        end
    end

    #link_list.delete(node)
    #Returns new LinkedList obj with node removed if found
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
        currentNode = self.head

        while currentNode != nil && currentNode.value != value
            currentNode = currentNode.next
        end

        return currentNode
    end

    #link_list.each do |block|
    #Yields each node in the link_list to block
    def each(&block)
        currentNode = self.head
        while currentNode != nil
            yield currentNode
            currentNode = currentNode.next
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
