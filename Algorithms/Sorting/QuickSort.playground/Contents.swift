/// Quick Sort Algorithm.
/// Didive and conquer.
/// 1. Pick a pivot point, partition the array.
/// 2. Values to left of pivot are smaller, values to right are larger
/// 3. Repeat steps 1 & 2 and sub-arrays

public func quickSort(array: inout [Int]) {
    quickSort(array: &array, lowIndex: 0, highIndex: array.count - 1)
}

private func quickSort(array: inout [Int], lowIndex: Int, highIndex: Int) {
    if lowIndex < highIndex {
        let partitionIndex = partition(array: &array, lowIndex: lowIndex, highIndex: highIndex)
        quickSort(array: &array, lowIndex: lowIndex, highIndex: partitionIndex - 1)
        quickSort(array: &array, lowIndex: partitionIndex + 1, highIndex: highIndex)
    }
}

private func partition(array: inout [Int], lowIndex: Int, highIndex: Int) -> Int {
    // Select last element as pivot value
    let pivotValue = array[highIndex]
    
    // Lowest element index
    var lowestIndex = lowIndex
    var temp: Int
    
    // Iterate from low to high, but exclude pivot
    for index in lowIndex..<highIndex {
        if array[index] <= pivotValue {
            // Swap current element with lower element
            temp = array[lowestIndex]
            array[lowestIndex] = array[index]
            array[index] = temp
            
            // Increment lowest index
            lowestIndex += 1
        }
    }
    
    // Move pivot into new position where lowest index left off
    temp = array[lowestIndex]
    array[lowestIndex] = array[highIndex]
    array[highIndex] = temp
    
    // Return calculated partition (pivot) index
    return lowestIndex
}

var unsortedArray = [8, 6, 4, 100, 67, 1, 98, 7]
var copy = unsortedArray
copy.sort()
quickSort(array: &unsortedArray)
print(unsortedArray)
print(copy)
assert(copy == unsortedArray)
