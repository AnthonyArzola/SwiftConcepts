/// Perform in-place sort.
/// Sort by finding smallest element and swapping it with 1st unsorted location.
/// Results in few swaps, but many comparisons.
func selectionSort(array: inout [Int]) {
    guard !array.isEmpty else { return }
    
    // Process input array once
    for unsortedIndex in 0..<array.endIndex {
        var smallestValueIndex = unsortedIndex
        var index = unsortedIndex
        
        // Find smallest value within unsorted section
        while index < array.count {
            if array[index] < array[smallestValueIndex] {
                // Found smaller value
                print("Found smallest value: \(array[smallestValueIndex])")
                smallestValueIndex = index
            }
            index += 1
        }

        // Swap smallest value with last known unsorted index
        print("Swap 🔄 1st unsorted \(array[unsortedIndex]) with smallest value of \(array[smallestValueIndex])")
        let temp = array[unsortedIndex]
        array[unsortedIndex] = array[smallestValueIndex]
        array[smallestValueIndex] = temp
    }
}

var unsortedArray = [3, 11, 2, 3, 10, 0, 55, 7, 1, 77, 7]
print("🤖 Array before sorting: \(unsortedArray)\n")

selectionSort(array: &unsortedArray)
print("🤖 Array after sorting: \(unsortedArray)")
