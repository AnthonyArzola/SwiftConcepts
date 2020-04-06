/// Perform in-place sort
func bubbleSort(array: inout [Int]) {
    
    var continueChecking = true
    while continueChecking {
        var swaps = 0
        // Loop through entire array and bubble element to correct position
        for index in 0..<array.count - 1 {
            if array[index] > array[index + 1] {
                // Current element evaluated is greater than next value...swap them
                let elementValue = array[index]
                array[index] = array[index + 1]
                array[index + 1] = elementValue
                swaps += 1
            }
        }
        continueChecking = swaps > 0
    }
}

var array = [3, 50, 1000, 88, 77, 4, 1]
bubbleSort(array: &array)
print("array after soring: \(array)")
