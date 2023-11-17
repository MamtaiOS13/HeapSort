import UIKit

func heapify(a: inout [Int], n: Int, index: Int) {
    
    var large = index
    var lc = 2*index + 1
    var rc = 2*index + 2
    
    // check if left child value is large
    if (lc < n && a[lc] > a[large]) {
        large = lc
    }
    
    // check if right child value is large
    if (rc < n && a[rc] > a[large]) {
        large = rc
    }
    
    // base case to break the recursion
    if (large != index) {
        let temp = a[index]
        a[index] = a[large]
        a[large] = temp
        heapify(a: &a, n: n, index: large)
    }
}

func buildMaxHeap(a: inout [Int]) {
    let n = a.count
    for i in (0...(n / 2 - 1)).reversed() {
        // Step1 and Step2 both uses heapify
        heapify(a: &a, n: n, index: i)
    }
}

func heapSort(a: inout [Int]) {
    let n = a.count
    // Step 1
    buildMaxHeap(a: &a)
    
    // Step 2
    for i in (1..<n).reversed() {
        // Swap elements
        let temp = a[0]
        a[0] = a[i]
        a[i] = temp
        // Step1 and Step2 both uses heapify
        heapify(a: &a, n: i, index: 0)
    }
}

var a = [12, 11, 13, 5, 6, 7]
print("Old Array :", a)
heapSort(a: &a)
print("\nNew Sorted Array :", a)
