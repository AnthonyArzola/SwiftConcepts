/// Merge Sort algorithm
///

public func sort(array: inout [Int]) {
    mergeSort(sourceArray: &array, leftIndex: 0, rightIndex: array.count - 1)
}

private func mergeSort(sourceArray: inout [Int], leftIndex: Int, rightIndex: Int) {
    // Determine middle index
    if leftIndex < rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        //print("MergeSort wtih leftIndex: \(leftIndex), rightIndex: \(rightIndex)")
        //print("middleIndex: \(middleIndex)\n")
        
        // Call mergeSort on left and right array
        mergeSort(sourceArray: &sourceArray, leftIndex: leftIndex, rightIndex: middleIndex)
        mergeSort(sourceArray: &sourceArray, leftIndex: middleIndex + 1, rightIndex: rightIndex)
        
        // Merge
        merge(sourceArray: &sourceArray, leftIndex: leftIndex, middleIndex: middleIndex, rightIndex: rightIndex)
    }
}

private func merge(sourceArray: inout [Int], leftIndex: Int, middleIndex: Int, rightIndex: Int) {
    //print("Merge with leftIndex:\(leftIndex), middleIndex:\(middleIndex), rightIndex:\(rightIndex)")
    
    // Create temp arrays to store left/right portions of array
    var leftArray = [Int]()
    var rightArray = [Int]()
    
    // Populate temp arrays based on indices passed in
    for index in leftIndex...middleIndex {
        leftArray.append(sourceArray[index])
    }
    for index in middleIndex + 1...rightIndex {
        rightArray.append(sourceArray[index])
    }
    
    //print("leftArray: \(leftArray)")
    //print("rightArray: \(rightArray)")
    
    // Update source array using sub-set arrays
    var i = 0;
    var j = 0;
    var arrayIndex = leftIndex
    while i < leftArray.count && j < rightArray.count {
        // Copy values into source array (asc value order)
        if leftArray[i] < rightArray[j] {
            sourceArray[arrayIndex] = leftArray[i]
            i += 1
        } else {
            sourceArray[arrayIndex] = rightArray[j]
            j += 1
        }
        arrayIndex += 1
    }
    
    // Copy over any remaining left sub-array items
    while i < leftArray.count {
        sourceArray[arrayIndex] = leftArray[i]
        arrayIndex += 1
        i += 1
    }
    // Copy over any remaining right sub-array items
    while j < rightArray.count {
        sourceArray[arrayIndex] = rightArray[j]
        arrayIndex += 1
        j += 1
    }
}


var unsortedArray = [3, 55, 12, 5, 10, 99, 201]
print("unsorted array:\n\(unsortedArray)")
sort(array: &unsortedArray)
print("After calling sort:\n\(unsortedArray)")


var unsortedArray2 = [3, 5, 10, 12, 55, 99, 201]
print("unsorted array:\n\(unsortedArray2)")
sort(array: &unsortedArray2)
print("After calling sort:\n\(unsortedArray2)")

var unsortedArray3 = [142, -4, 65, 12, 75, 99, 1]
print("unsorted array:\n\(unsortedArray3)")
sort(array: &unsortedArray3)
print("After calling sort:\n\(unsortedArray3)")
