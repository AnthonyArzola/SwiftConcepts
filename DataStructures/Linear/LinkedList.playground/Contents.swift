import UIKit

class LinkedNode<T> {
    init(value: T, nextNode: LinkedNode<T>? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
    // Stored value
    let value: T
    // Pointer to next linked node.
    var nextNode: LinkedNode<T>?
}

/*
 Class that implements link-list data structure
 Ex:    [3]->nil (single node where first/last are the same)
        [23]->[3]->nil (two nodes, where first node is 3, last node is 23)
 */

class LinkedList<T> {
    var firstNode: LinkedNode<T>?
    var lastNode: LinkedNode<T>?
    private(set) var count: Int = 0
    
    /// Add new `LinkedNode` to front.
    /// Ex: Existing LinkedList [3]->nil with call to `addFirst(35)` will
    /// result in [3]->[35]->nil where `firstNode` is 35 and `lastNode` is 3.
    func addFirst(value: T) {
        guard count > 0 else {
            // LinkedList is empty, make it first and last node.
            firstNode = LinkedNode(value: value)
            lastNode = firstNode
            count = 1
            return
        }
        
        if let first = firstNode {
            let previousNode = first
            let newFirstNode = LinkedNode(value: value)
            previousNode.nextNode = newFirstNode
            
            // Update pointers, count
            firstNode = newFirstNode
            count += 1
        }
    }

    /// Add new `LinkedNode` at the end
    /// Ex: Existing LinkedList [3]->nil with call to `addLast(23)` will
    /// result in [23]->[3]->nil where `firstNode` is 3 and `lastNode` is 23.
    func addLast(value: T) {
        guard count > 0 else {
            // LinkedList is empty, make new last node equal to first node.
            lastNode = LinkedNode(value: value)
            firstNode = lastNode
            count = 1
            return
        }
        if let last = lastNode {
            let previous = lastNode
            let newLastNode = LinkedNode(value: value)
            
            // Update pointers, count
            newLastNode.nextNode = previous
            lastNode = newLastNode
            count += 1
        }
    }
    
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
linkedList.addFirst(value: 4)
assert(linkedList.count == 1)
assert(linkedList.firstNode?.value ?? Int.min == 4)

linkedList.addFirst(value: 32)
assert(linkedList.count == 2)
assert(linkedList.firstNode?.value ?? Int.min == 32)
assert(linkedList.lastNode?.value ?? Int.min == 4)

linkedList.addLast(value: 5)
assert(linkedList.count == 3)
assert(linkedList.lastNode?.value ?? Int.min == 5)

linkedList.clear()
assert(linkedList.count == 0)
