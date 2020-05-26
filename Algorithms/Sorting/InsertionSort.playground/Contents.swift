/// Perform in-place sort.
/// Sort each element in array as it is encountered - do not revisit sorted elements.
/// Iterate through array (➡️) and compare current against left values (⬅️).
/// If left value is smaller, take out right value and "insert" left value in its place (perform swap).
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
        //if unsortedIndex == 0 { print("Single element considered sorted. Skipping it."); continue }
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
