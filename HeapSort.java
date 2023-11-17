public class HeapSort {

public static void heapify(int[] a, int n, int i) {

int large = i ;
int lc = 2*i + 1;
int rc = 2*i + 2;

if (lc < n && a[lc] > a[large]) {
    large = lc;
}

if (rc < n && a[rc] > a[large]) {
    large = rc;
}
// base case
if(large != i) {
    swap(a, i, large);
    heapify(a, n, large);
}
}

public static void buildMaxHeap(int[] a) {
        int n = a.length;
        for(int i = n/2 - 1; i >= 0; i--){
            heapify(a, n, i);
        }
 }

public static void swap(int[] a, int i, int j){
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
}

public static void printArray(int[] a){
        for(int num : a) {
          System.out.print(num + " ");
        }
}

public static void heapSort(int[] a) {
        int n = a.length;

        // Step 1 
        buildMaxHeap(a);

        // Step 2
        for(int i = n-1 ; i > 0; i--){
            swap(a, 0, i);
            heapify(a, i, 0);
        }
}

public static void main(String[] args) {
    int[] a = {12, 11, 13, 5, 6, 7};
    System.out.println("Old Array");
    printArray(a);
    heapSort(a);
    System.out.println();
    System.out.println("New Array");
    printArray(a);
    System.out.println();
}
}