/// Implement DFS searching algorithm using stack and recursion.

class Node {
    let name: String
    var children: [Node]
    var visited = Set<String>()
    
    init(name: String) {
        self.name = name
        children = []
    }
    
    func addChild(name: String) -> Node {
        let childNode = Node(name: name)
        children.append(childNode)
        
        return self
    }
    
    /// Stack based method. Will traverse right-to-left.
    func dfsRight(array: inout [String]) -> [String] {
        // Use `stack` to perform DFS
        var fakeStack = [Node]()
        fakeStack.insert(self, at: 0)
        
        // Use `set` to keep track of visited nodes
        var visited = Set<String>()
        
        while fakeStack.count > 0 {
            let currentNode = fakeStack.removeFirst()
            
            // Make sure we haven't visited this node before
            if visited.contains(currentNode.name) {
                continue
            } else {
                // Mark as visited
                visited.insert(currentNode.name)
                // Update array
                array.append(currentNode.name)
            }
            
            // Add children to stack
            for childNode in currentNode.children {
                if !visited.contains(childNode.name) {
                    fakeStack.insert(childNode, at: 0)
                }
            }
        }
        
        return array
    }
    
    /// Recursive traversal method. Traverses left-to-right.
    func depthFirstSearch(array: inout [String]) -> [String] {
        // Call recursive traversal method
        dfsTraversal(node: self, array: &array)
        
        return array
    }
    
    /// Recursive method.
    private func dfsTraversal(node: Node, array: inout [String]) {
        
        if visited.contains(node.name) {
            return
        } else {
            visited.insert(node.name)
            array.append(node.name)
        }
        
        for childNode in node.children {
            dfsTraversal(node: childNode, array: &array)
        }
    }
}
