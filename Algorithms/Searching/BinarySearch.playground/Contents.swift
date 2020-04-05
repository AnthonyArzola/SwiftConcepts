
// Perform binary search on array
func binarySearch(array: [Int], value: Int) -> Int {
    guard !array.isEmpty else { return -1 }
    
    var arrayCopy = array
    return recursiveSearch(array: &arrayCopy, leftIndex: 0, rightIndex: array.count - 1, value: value)
}

func recursiveSearch(array: inout [Int], leftIndex: Int, rightIndex: Int, value: Int) -> Int {
    if (leftIndex <= rightIndex) {
        // Determine array mid-point
        let middleIndex = (leftIndex + rightIndex) / 2
        
        if value == array[middleIndex] {
            // Found it!
            return middleIndex
        } else if value > array[middleIndex] {
            // Continue searching right-hand-side (exclude index value checked already)
            return recursiveSearch(array: &array, leftIndex: middleIndex + 1, rightIndex: rightIndex, value: value)
        } else {
            // Continue searching left-hand-side (exclude index value checked already)
            return recursiveSearch(array: &array, leftIndex: leftIndex, rightIndex: middleIndex - 1, value: value)
        }
    }
    return -1
}

// Binary Search requires elements to be sorted.
var numbers = [7, 21, 50, 51, 55, 56, 83, 500, 1003, 50000, 2000048]
numbers.sort()

var index = binarySearch(array: numbers, value: 1003)
print("Searching for 1003 found at index \(index)")

index = binarySearch(array: numbers, value: 22)
print("Searching for 22 found at index \(index)")

