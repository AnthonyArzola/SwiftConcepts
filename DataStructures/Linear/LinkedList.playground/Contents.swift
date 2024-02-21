import UIKit

class LinkedNode<T: Comparable> {
    init(value: T, nextNode: LinkedNode<T>? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
    // Stored value.
    let value: T
    // Pointer to next linked node.
    var nextNode: LinkedNode<T>?
}

extension LinkedNode: Equatable {
    static func == (lhs: LinkedNode<T>, rhs: LinkedNode<T>) -> Bool {
        return lhs.value == rhs.value
        && lhs.nextNode == rhs.nextNode
    }
}

/*
 Class that implements link-list data structure
 Ex:    [3]->nil (single node where first/last are the same)
        [55]->[3]->nil (two nodes, where first node is 55, last node is 3)
 */

class LinkedList<T: Comparable> {
    var firstNode: LinkedNode<T>?
    var lastNode: LinkedNode<T>?
    private(set) var count: Int = 0
    
    /// Add new `LinkedNode` to front.
    /// Ex: Existing LinkedList [3]->nil with call to `addFirst(55)` will
    /// result in [55]->[3]->nil where `firstNode` is 55 and `lastNode` is 3.
    func addFirst(value: T) {
        guard count > 0 else {
            // LinkedList is empty, make it first and last node.
            firstNode = LinkedNode(value: value)
            lastNode = firstNode
            count = 1
            return
        }
        
        if let first = firstNode {
            let previousFirstNode = first
            let newFirstNode = LinkedNode(value: value)
            
            // Update pointers, count
            newFirstNode.nextNode = previousFirstNode
            firstNode = newFirstNode
            count += 1
        }
    }

    /// Add new `LinkedNode` at the end
    /// Ex: Existing LinkedList [3]->nil with call to `addLast(45)` will
    /// result in [3]->[45]->nil where `firstNode` is 3 and `lastNode` is 45.
    func addLast(value: T) {
        guard count > 0 else {
            // LinkedList is empty, make new last node equal to first node.
            lastNode = LinkedNode(value: value)
            firstNode = lastNode
            count = 1
            return
        }
        if let last = lastNode {
            let previousLastNode = last
            let newLastNode = LinkedNode(value: value)
            
            // Update pointers, count
            previousLastNode.nextNode = newLastNode
            lastNode = newLastNode
            count += 1
        }
    }
    
    /// Remove first `LinkedNode`.
    func removeFirst() {
        guard count > 0 else {
            return
        }
        if let first = firstNode {
            firstNode = firstNode?.nextNode
            count -= 1
        }
    }
    
    /// Remove last `LinkedNode`.
    func removeLast() {
        guard count > 0 else {
            return
        }
        var currentNode = firstNode
        for index in 0..<count {
            currentNode = currentNode?.nextNode
        }
        currentNode?.nextNode = nil
        lastNode = currentNode
        count -= 1
    }
    
    /// Search Linked LIst for specified value.
    func contains(value: T) -> Bool {
        var currentNode = firstNode
        while currentNode != nil {
            if currentNode?.value == value {
                return true
            }
            currentNode = currentNode?.nextNode
        }
        return false
    }
    
    /// Clear Linked List.
    func clear() {
        firstNode = nil
        lastNode = nil
        count = 0
    }
    
    func printNodes() {
        var currentNode: LinkedNode? = firstNode
        while currentNode != nil {
            print("[\(String(describing: currentNode?.value))] ")
            // Keep moving
            currentNode = currentNode?.nextNode
        }
    }
    
}

var linkedList = LinkedList<Int>()
// Add first
linkedList.addFirst(value: 4)
assert(linkedList.count == 1)
assert(linkedList.firstNode?.value ?? Int.min == 4)

// Add first
linkedList.addFirst(value: 32)
assert(linkedList.count == 2)
assert(linkedList.firstNode?.value ?? Int.min == 32)
assert(linkedList.lastNode?.value ?? Int.min == 4)

// Add last
linkedList.addLast(value: 5)
assert(linkedList.count == 3)
assert(linkedList.lastNode?.value ?? Int.min == 5)

//Search
linkedList.printNodes()
assert(linkedList.contains(value: 5))
assert(!linkedList.contains(value: 55))

// Clear
linkedList.clear()
assert(linkedList.count == 0)
assert(!linkedList.contains(value: 5))

// Add last, remove first
linkedList.addLast(value: 28)
assert(linkedList.count == 1)
linkedList.removeLast()
assert(linkedList.count == 0)

// Add last, add last, remove first
linkedList.addLast(value: 11)
linkedList.addLast(value: 22)
linkedList.removeFirst()
assert(linkedList.count == 1)
assert(linkedList.firstNode?.value == 22)
