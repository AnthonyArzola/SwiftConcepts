import UIKit

/// Model a doubly-linked node
class DoublyLinkedNode<T: Comparable> {
    var value: T
    var nextNode: DoublyLinkedNode?
    var previousNode: DoublyLinkedNode?
    
    init(value: T, nextNode: DoublyLinkedNode? = nil, previousNode: DoublyLinkedNode? = nil) {
        self.value = value
        self.nextNode = nextNode
        self.previousNode = previousNode
    }
}

extension DoublyLinkedNode: Equatable {
    static func == (lhs: DoublyLinkedNode<T>, rhs: DoublyLinkedNode<T>) -> Bool {
        return lhs.value == rhs.value
        && lhs.nextNode == rhs.nextNode
        && lhs.previousNode == rhs.nextNode
    }
}

// Doubly-Linked List data structure
class DoublyLinkedList<T: Comparable> {
    
    var firstNode: DoublyLinkedNode<T>?
    var lastNode: DoublyLinkedNode<T>?
    private(set) var count: Int = 0
    
    init () { }
    
    init(value: T) {
        createFirstNode(value: value)
    }
    
    /// Adds new ``DoublyLinkedNode`` at the beginning of the doubly linked list.
    func addFirst(value: T) {
        guard count > 0 else {
            // List is empty
            createFirstNode(value: value)
            return
        }
        
        if let previousFirstNode = firstNode {
            // Ex: nil<-[23]<->[11]->nil, call to `addFirst` with 5 would result in
            //     nil<-[5]<->[23]<->[11]->nil
            var newNode = DoublyLinkedNode(value: value)
            // Update references
            newNode.nextNode = previousFirstNode
            previousFirstNode.previousNode = newNode
            // Update firstNode pointer and count
            firstNode = newNode
            count += 1
        }
    }
    
    /// Adds new ``DoublyLinkedNode`` at the end of the doubly linked list.
    func addLast(value: T) {
        guard count > 0 else {
            // List is empty
            createFirstNode(value: value)
            return
        }
        if let previousLastNode = lastNode {
            // Ex: nil<-[23]<->[11]->nil, call to `addLast` with 5 would result in
            //     nil<-[23]<->[11]<->[5]
            var newNode = DoublyLinkedNode(value: value)
            // Update references
            previousLastNode.nextNode = newNode
            newNode.previousNode = previousLastNode
            // Update last node pointer and count
            lastNode = newNode
            count += 1
        }
    }
    
    /// Clear doubly linked list.
    func clear() {
        firstNode = nil
        lastNode = nil
        count = 0
    }
    
    /// Print doubly linked list contents.
    func printList() {
        var currentNode: DoublyLinkedNode? = firstNode
        while currentNode != nil {
            print(" [\(String(describing: currentNode?.value))] ")
            currentNode = currentNode?.nextNode
        }
    }
    
    /// Search doubly linked list for specified value.
    func contains(value: T) -> Bool {
        guard count > 0 else { return false }
        var currentNode: DoublyLinkedNode? = firstNode
        while currentNode != nil {
            if currentNode?.value == value {
                return true
            }
            currentNode = currentNode?.nextNode
        }
        return false
    }
    
    /// Common code that create initial node.
    private func createFirstNode(value: T) {
        var newNode = DoublyLinkedNode(value: value)
        firstNode = newNode
        lastNode = firstNode
        count = 1
    }
}

var doublyLinkedList = DoublyLinkedList<Int>()
assert(doublyLinkedList.count == 0)
assert(doublyLinkedList.firstNode == nil)
assert(doublyLinkedList.lastNode == nil)

// Add initial node, verify count and first/last node are the same
doublyLinkedList.addFirst(value: 23)
assert(doublyLinkedList.count == 1)
assert(doublyLinkedList.firstNode != nil)
assert(doublyLinkedList.firstNode?.value ?? Int.min == 23)
assert(doublyLinkedList.lastNode?.value ?? Int.min == 23)

// Add first, verify count, fist/last node and value
doublyLinkedList.addFirst(value: 17)
assert(doublyLinkedList.count == 2)
assert(doublyLinkedList.firstNode?.value ?? Int.min == 17)
assert(doublyLinkedList.lastNode?.value ?? Int.min == 23)

// Add last, verify count, last node and value
doublyLinkedList.addLast(value: 54)
assert(doublyLinkedList.count == 3)
assert(doublyLinkedList.lastNode?.value ?? Int.min == 54)
doublyLinkedList.printList()

// Add last, verify count, last node and value
doublyLinkedList.addLast(value: 100)
assert(doublyLinkedList.count == 4)
assert(doublyLinkedList.lastNode != nil)
assert(doublyLinkedList.lastNode?.value ?? Int.min == 100)

doublyLinkedList.clear()
assert(doublyLinkedList.count == 0)
assert(doublyLinkedList.firstNode == nil)
assert(doublyLinkedList.lastNode == nil)
