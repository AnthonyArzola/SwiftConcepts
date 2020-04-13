/// Perform in-place sort.
func insertionSort(array: inout [Int]) {
    guard !array.isEmpty else { return }
    
    // Start at second element. Single element is considered sorted.
    for (unsortedIndex, element) in array.enumerated() {
        if unsortedIndex == 1 { continue }
        var sortedIndex = unsortedIndex - 1
        
        while sortedIndex >= 0 && array[sortedIndex] > element {
            // Shift sorted value to the right, decrement index
            array[sortedIndex + 1] = array[sortedIndex]
            sortedIndex -= 1
        }
        // Copy current value into sorted section
        array[sortedIndex + 1] = element
    }
}

var unsortedArray = [3, 11, 2, 10, 0, 55, 7, 1]
print("Array before sorting: \(unsortedArray)")

insertionSort(array: &unsortedArray)
print("Array after sorting:  \(unsortedArray)")
