// Perform binary search on array
func binarySearch(array: [Int], value: Int) -> Int {
    guard !array.isEmpty else { return -1 }
    
    var arrayCopy = array
    print("Search for \(value) within \(array)")
    return recursiveSearch(array: &arrayCopy, leftIndex: 0, rightIndex: array.count - 1, value: value)
}

func recursiveSearch(array: inout [Int], leftIndex: Int, rightIndex: Int, value: Int) -> Int {
    print("Left index: \(leftIndex), right index: \(rightIndex)")
    if leftIndex <= rightIndex {
        // Determine array mid-point
        let middleIndex = (leftIndex + rightIndex) / 2
        print("Calculated midpoint index: \(middleIndex)")
        if value == array[middleIndex] {
            // Found it!
            print("Found it! Midpoint index contains value we are looknig for.")
            return middleIndex
        } else if value > array[middleIndex] {
            print("No match found. Value \(value) is > midpoint value \(array[middleIndex]). Search to the right.")
            // Continue searching right-hand-side (exclude index value checked already)
            return recursiveSearch(array: &array, leftIndex: middleIndex + 1, rightIndex: rightIndex, value: value)
        } else {
            print("No match found. Value \(value) is < midpoint value \(array[middleIndex]). Search to the left.")
            // Continue searching left-hand-side (exclude index value checked already)
            return recursiveSearch(array: &array, leftIndex: leftIndex, rightIndex: middleIndex - 1, value: value)
        }
    }
    print("Left index \(leftIndex) >= \(rightIndex) right index. Return -1 since we couldn't find a match.")
    return -1
}

// Binary Search requires elements to be sorted.
var numbers = [7, 21, 50, 51, 55, 56, 83, 500, 1003, 50000, 2000048]
numbers.sort()

var index = binarySearch(array: numbers, value: 1003)
print("Searching for 1003 found at index \(index)")

index = binarySearch(array: numbers, value: 22)
print("Searching for 22 found at index \(index)")
