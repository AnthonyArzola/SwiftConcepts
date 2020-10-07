/// BFS algorithm implementation.

class Node {
    var name: String
    var children: [Node]
    
    init(name: String) {
        self.name = name
        children = []
    }
    
    // Use `Set` to track previously visited nodes.
    var bfsVisited = Set<String>()
    
    func addChild(name: String) -> Node {
        let childNode = Node(name: name)
        children.append(childNode)
        
        return self
    }
    
    func breadthFirstSearch(array: inout [String]) -> [String] {
        bfsQueueTraversal(node: self, array: &array)
        return array
    }
    
    /// BFS traversal using `queue`.
    private func bfsQueueTraversal(node: Node, array: inout [String]) {
        var fakeQueue = [Node]()
        fakeQueue.append(node) // Init with node passed in
        
        while !fakeQueue.isEmpty {
            let currentNode = fakeQueue.removeFirst()
            
            // Skip previously visited node
            if bfsVisited.contains(currentNode.name) { continue }
            
            // Mark as visited
            bfsVisited.insert(currentNode.name)
            // Update array
            array.append(currentNode.name)
            
            // Use queue to process child nodes
            for childNode in currentNode.children {
                fakeQueue.append(childNode)
            }
        }
    }
}
