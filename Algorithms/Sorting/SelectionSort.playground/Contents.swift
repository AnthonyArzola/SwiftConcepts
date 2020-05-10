
func selectionSort(array: inout [Int]) {
    guard !array.isEmpty else { return }
    
    // Process input array once
    for (unsortedIndex, element) in array.enumerated() {
        var smallestValueIndex = unsortedIndex
        var index = unsortedIndex
        
        // Find smallest value within unsorted section
        while index < array.count {
            if array[index] <= array[smallestValueIndex] {
                // Found smaller value
                smallestValueIndex = index
            }
            index += 1
        }

        // Swap smallest value with last known unsorted index
        let temp = array[unsortedIndex]
        array[unsortedIndex] = array[smallestValueIndex]
        array[smallestValueIndex] = temp
    }
}

var unsortedArray = [3, 11, 2, 10, 0, 55, 7, 1]
print("Array before sorting: \(unsortedArray)")

selectionSort(array: &unsortedArray)
print("Array after sorting: \(unsortedArray)")
