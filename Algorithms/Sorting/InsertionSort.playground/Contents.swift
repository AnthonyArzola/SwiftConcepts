/// Perform in-place sort.
/// Sort each element in array as it is encountered - do not revisit sorted elements.
/// Iterate through array (➡️) and compare current unsorted value against left sorted values (⬅️)
/// Shift all smaller values
func insertionSort(array: inout [Int]) {
    guard !array.isEmpty else { return }
    
    // Example
    // [1, 3, 8, 100, 7, 19]
    //                ^_____ unsorted index (element)
    //            ^_________ sorted index
    
    // element = 7
    // before while-loop pass   : [1, 3, 8, 100, 7, 19]
    // while-loop pass          : [1, 3, 8, 100, 100, 19]
    // another pass             : [1, 3, 8, 8, 100, 19]
    // after while-loop         : [1, 3, 7, 8, 100, 19]
    
    // Start at second element. Single element is considered sorted.
    for unsortedIndex in 1..<array.count {
        let currentUnsortedValue = array[unsortedIndex]
        var sortedIndex = unsortedIndex - 1
        
        while sortedIndex >= 0 && array[sortedIndex] > currentUnsortedValue {
            // Shift (copy) sorted value to the right, decrement index
            print("Shift \(array[sortedIndex]) ➡️ at [\(sortedIndex)] to [\(sortedIndex + 1)]")
            array[sortedIndex + 1] = array[sortedIndex]
            sortedIndex -= 1
        }
        // Copy current value into sorted section
        print("Copy unsorted \(currentUnsortedValue) ⬇️ into sorted section at index [\(sortedIndex + 1)]")
        array[sortedIndex + 1] = currentUnsortedValue
        
        print("Array after mods: \(array)\n")
    }
}

var unsortedArray = [3, 11, 2, 10, 0, 55, 7, 1]
print("🤖 Array before sorting: \(unsortedArray)")

insertionSort(array: &unsortedArray)
print("🤖 Array after sorting:  \(unsortedArray)")


///
/// AlgoExpert implementation
///

// Insertion sort overview... "insert" unsorted item into proper location within sorted section
// 1. Loop through array starting at second item or Index = 1 (Index 0 considered sorted)
// 2. Use while loop, index starting at sorted section's right boundary and go backwards until:
//   - index reaches boundary (index = 0) OR current item (unsorted) is < sorted item
//   - while performing loop...shift values to the RIGHT

func insertionSort(array: inout [Int]) -> [Int] {
    
    // Iterate through array once, changing inflection point between sorted & unsorted sections
    // First element is considered sorted, so we can start @ index 1
    for unsortedIndex in 1..<array.count {
        var sortedIndex = unsortedIndex - 1
        let unsortedValue = array[unsortedIndex] // Hold value until we find location to `insert`
        
        // If current sorted item is bigger than unsorted item ...
        while sortedIndex >= 0 && array[sortedIndex] > unsortedValue {
            // Shift sorted item to the right
            array[sortedIndex + 1] = array[sortedIndex]
            sortedIndex -= 1
        }
        
        // Note: account for last decrement
        // Insert unsorted value into appropriate location
        array[sortedIndex + 1] = unsortedValue
        
    }
    
    return array
}


