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
                print("Smallest value so far: \(array[index])")
                smallestValueIndex = index
            }
            index += 1
        }

        // Swap smallest value with last known unsorted index
        print("Swap 🔄 1st unsorted value of \(array[unsortedIndex]) with smallest value of \(array[smallestValueIndex]) at unsorted index [\(unsortedIndex)]")
        let temp = array[unsortedIndex]
        array[unsortedIndex] = array[smallestValueIndex]
        array[smallestValueIndex] = temp
        print("Array so far: \(array) \n")
    }
}

//var unsortedArray = [3, 11, 2, 3, 10, 0, 55, 7, 1, 77, 7]
//print("🤖 Array before sorting: \(unsortedArray)\n")
//
//selectionSort(array: &unsortedArray)
//print("🤖 Array after sorting: \(unsortedArray)")

///
/// AlgoExpert implementation
///

/// Overview: Selection sort..."select smallest item"

// 1. Loop through unsorted array section and find smallest item (for-loop)
// 2. Determine smallest value
// 3. Swap smallest value with last index location in sorted section

func selectionSort2(array: inout [Int]) -> [Int] {

    // Loop through unsorted array section once
    for unsortedIndex in 0..<array.count {
        // Find smallest value within unsorted section Ex: [ sorted | unsorted ]
        var idx = unsortedIndex
        var smallestValueIndex = unsortedIndex // default
        while idx < array.count {
            if array[idx] < array[smallestValueIndex] {
                // Store smallest value index
                smallestValueIndex = idx
            }
            idx += 1
        }
        
        // Swap smallest value with last index location in sorted section
        let temp = array[unsortedIndex]
        array[unsortedIndex] = array[smallestValueIndex]
        array[smallestValueIndex] = temp
    }
    
    return array
}

var aeInput1 = [8, 5, 2, 9, 5, 6, 3]
let sortedArray = selectionSort2(array: &aeInput1)
print(sortedArray)

