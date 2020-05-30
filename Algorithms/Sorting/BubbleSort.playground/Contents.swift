/** Perform in-place sort.
On each pass
 * Compare current item to right neighbor and swap if current item is larger than neighbor.
 * Repeat for remaining array items
Perform subsequent passes until no swaps are performed.
*/
func bubbleSort(array: inout [Int]) {

    var continueChecking = true
    while continueChecking {
        var swaps = 0
        // Loop through entire array and bubble element to correct position
        for index in 0..<array.count - 1 {
            if array[index] > array[index + 1] {
                // Current element evaluated is greater than next value...swap them
                print("\(array[index]) is bigger than right neighbor \(array[index + 1]). Bubble it up! 💭")
                let elementValue = array[index]
                array[index] = array[index + 1]
                array[index + 1] = elementValue
                swaps += 1
                print("Array after swap 🔄: \(array)\n")
            }
        }
        continueChecking = swaps > 0
    }
}

var array = [3, 50, 1000, 88, 77, 4, 1, 33, 1, 1]
// Create copy and sort it using built-in methods so we can compare results against implementation above
var sortedCopy = array.sorted()

print("🤖 Array before sorting: \(array)\n")

bubbleSort(array: &array)
print("🤖 Array after soring: \(array)")

assert(array == sortedCopy)
