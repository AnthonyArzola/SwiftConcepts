
func selectionSort(array: inout [Int]) {
    guard !array.isEmpty else { return }
    
    for (unsortedIndex, element) in array.enumerated() {
        var smallestValueIndex = unsortedIndex
        var index = unsortedIndex
        
        while index < array.count {
            if array[index] <= array[smallestValueIndex] {
                smallestValueIndex = index
            }
            index += 1
        }
        
        let temp = array[unsortedIndex]
        array[unsortedIndex] = array[smallestValueIndex]
        array[smallestValueIndex] = temp
    }
}

var unsortedArray = [3, 11, 2, 10, 0, 55, 7, 1]
print("Array before sorting: \(unsortedArray)")

selectionSort(array: &unsortedArray)
print("Array after sorting: \(unsortedArray)")
