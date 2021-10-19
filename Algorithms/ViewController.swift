

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sol = Solution()
        let arr = [1,3,5,23,21,98,87,32,10,89,100]

        // let pos = sol.search(arr, 3)
        
        let pos = sol.findPeakElement(nums: arr)
        print(pos)
        
        let shuffledItems = sol.shuffleItems(arrItems: arr)
        print("Shuffle array \(shuffledItems)")
        let temp = [3,1,2]

        print("Min \(sol.findMinimumFromRotatedArray(in: temp, low: 0, high: temp.count-1))")

        let stringAlgos = StringAlgorithms()
//       print("Palindrome or not: \(stringAlgos.palindrome(orignal: "Step on No Pets"))")
        print("Palindrome or not: \(stringAlgos.palindrome_recurse("Step on No Pets"))")

        // Do any additional setup after loading the view.
        
//        let original_arr = [5,7,7,8,8,10]
//        let pos_range = sol.searchRange(original_arr, 8)
//        var output = [Int]() 
//        if let fPos = original_arr.firstIndex(of: 8){
//            output.append(fPos)
//        }
//        if let lPos = original_arr.lastIndex(of: 8){
//            output.append(lPos)
//        }
//        print("Output \(output)")
//        print("item at pos \(pos_range) and \(original_arr[pos_range])")
//        
//        print("search for a range \(sol.searchRange([5,7,7,8,8,10], 8))")
        
//        print("closest elements: \(sol.printKClosestElements([1,1,1,10,10,10],1,9))")
//        
//        print("Power \(sol.myPow(2.0, 10))")
//        
//        print("is perfect square \(sol.isPerfectSquare(14))")
//        
//        print("next to closest \(sol.nextGreatestLetter(["e","e","e","e","e","e","n","n","n"],"e"))")
//        
//
//        print("Power *** \(sol.power(4, 3))")
        
        //Array Algorithms
        
        var arrayAlgos = ArrayAlgorithms()
        var arry = [1,0,2,3,0,4,5,0]
        arrayAlgos.anotherDuplicateZeros(&arry)
        print("duplicate zeros \(arry)")
        arry = [1,1,0,1,1,1]
       let max = arrayAlgos.findMaxConsecutiveOnes(arry)
        print("Consecutive ones \(max)")
        
        arry = [555,9012,4821,1771]
        print(arrayAlgos.findNumbers(arry))
        
        arry = [-7,-3,2,3,11]
        print(arrayAlgos.sortedSquares(arry))
    }

}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}


class Solution {
    
    
    func power(_ x: Double, _ n: Int) -> Double {
        
        var temp = 0.0
        
        if n == 0{
            return 1
        }
        temp = power(x, n/2)

        if n%2 == 0 {
            return temp * temp
        }
        else{
            if n > 0 {
                return temp * temp * x
            }
            else{
                return (temp * temp)/x
            }
        }
        
        return temp
        
    }
    
    
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        
        var asciiArr = letters.map{
            Int($0.asciiValue!)
        } 
        
        asciiArr = asciiArr.unique()


        let ch = binarySearch(in: asciiArr, low: 0, high: asciiArr.count - 1, key: Int(target.asciiValue!))
        
        if (ch >= 0) {
            if (ch < asciiArr.count-1) {
                    return Character(UnicodeScalar(asciiArr[ch+1])!)
                }
            else if ch == asciiArr.count - 1{
                return Character(UnicodeScalar(asciiArr[0])!)
             }
            return Character(UnicodeScalar(asciiArr[ch])!)

               } else{
                   print("Ascii \(asciiArr[0])")
                   return Character(UnicodeScalar(asciiArr[0])!)
               } 
        }
    
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 1
        var right = num
        
        while left<=right {
            let mid = (left + right) / 2
            if (mid * mid) == num {
                return true
            }
            if mid*mid < left {
                left = mid + 1
            }
            else{
                right = mid - 1
            }
        }
        return false
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
            
        var temp = Int(x)
        for i in 1..<n {
        temp = Int(x) * temp
        }
        print("temp \(temp)")
            
        if n > 0 {
                return Double(temp)
            }
            else{
              return Double(1/temp)
                
            }
    }
    
    // MARK: - Fisher-Yates algorithm for shuffle items in array
    func shuffleItems(arrItems: [Int]) -> [Int]{
        
        var items = arrItems
        
        var pos = arrItems.count - 1
        
        while pos > 0 {
            let rand = Int.random(in: 0..<pos)
            items.swapAt(pos, rand)
            pos -= 1
        }
        return items
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        let n = nums.count
        
        let pivot = findPivot(in: nums, low: 0, high: n-1)
        
        if pivot == -1 {
            return binarySearch(in: nums, low: 0, high: n-1,key: target)
        }
        if (nums[pivot] == target) {  return pivot }
        
        if(nums[0] <= target) {
            return binarySearch(in: nums, low: 0, high: pivot-1, key: target)
        }
        return  binarySearch(in: nums, low: pivot+1, high: n-1, key: target)
        
    }
    
    
    func findPivot(in arr: [Int], low: Int, high: Int) -> Int{
            
            if low == high { return low }
            if low > high { return -1   }
            
            let mid = ((low+high) / 2)
            
            if ( mid < high && arr[mid] > arr[mid+1]) {
                return mid
            }
            if ( mid > low && arr[mid] < arr[mid - 1]) {
                return (mid - 1)
            }
            
            if arr[low] > arr[mid] {
               return findPivot(in: arr, low: low, high: mid-1)
            }
            return findPivot(in: arr, low: mid + 1, high: high)
        }
        
    
    func findMinimumFromRotatedArray(in arr: [Int], low: Int, high: Int) -> Int{
        
        if low == high { return arr[0] }
        if low > high { return -1   }
        
        let mid = ((low+high) / 2)
        
        if ( mid < high && arr[mid] > arr[mid+1]) {
            return arr[mid+1]
        }
        if ( mid > low && arr[mid] < arr[mid - 1]) {
            return arr[mid]
        }
        
        if arr[low] > arr[mid] {
           return findPivot(in: arr, low: low, high: mid-1)
        }
        return findPivot(in: arr, low: mid + 1, high: high)
    }
    
    
    func binarySearch(in arr: [Int], low: Int, high: Int, key: Int) -> Int {
        
        if high < low { return high }
        
        let mid = ((high + low) / 2)
        
        if (key == arr[mid])    {   return mid  }
       
        if (key > arr[mid]) {
          return binarySearch(in: arr, low: mid+1, high: high, key: key)
        }
        return binarySearch(in: arr, low: low, high: mid - 1, key: key)
    }
    
    
    func findCrossOver(_ arr: [Int], _ low: Int, _ high: Int, x: Int) -> Int {
        
        //base cases
        if (arr[low] > x) { //x is smaller than all
            return low
        }
        if (arr[high] <= x){ //x is greater than all
            return high
        }
        //find middle point
        let mid = (low + high)/2
        if (arr[mid] <= x && arr[mid+1] > x){
            return mid
        }
        
        if(arr[mid+1] < x){
            return findCrossOver(arr, mid+1, high, x: x)
        }
        return findCrossOver(arr, low, mid-1, x: x)
    }
    
    func printKClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        if arr.count == 1 { return arr }
               
               // find the first number >= x
               var lo = 0, hi = arr.count - 1
               while lo < hi {
                   let m = lo + (hi - lo) / 2
                   if arr[m] < x { lo = m + 1
                   } else { hi = m
                   }
               }
               
               // move `lo` to left (< x) and get candidates ready
               lo -= 1
               
               // move `lo` and `hi` to form the range. `lo` and `hi` are exclusive
               while hi - lo - 1 < k {
                   if lo >= 0 && hi < arr.count {
                       if x - arr[lo] <= arr[hi] - x {
                           lo -= 1
                       } else {
                           hi += 1
                       }
                   } else if lo >= 0 {
                       lo -= 1
                   } else if hi < arr.count {
                       hi += 1
                   } else {
                       fatalError() // we are told that k <= arr.count
                   }
               }
               
               return Array(arr[lo+1..<hi])
           }


    
    
    func findPeakElement(nums: [Int]) -> Int {
        //return insertionSort(nums: nums)
        return search_recursive(nums, 0, nums.count-1)
    }
    
    
    func search_recursive(_ nums: [Int],_ left: Int, _ right: Int) -> Int{
        
        guard left != right else{
            return left
        }
        
        let mid = ((left + right)/2)
        
        if nums[mid] > nums[mid+1]{
           return search_recursive(nums, left, mid)
        } else{
           return search_recursive(nums, mid+1, right)
        }
    }
    
    private func insertionSort(nums: [Int]) -> Int {
        
        var sortedArr = nums
        
        //insertion sort
        
        for index in 1..<nums.count
        {
            let value = sortedArr[index]
            var position = index

            while position > 0 && sortedArr[position - 1] > value {
                sortedArr[position] = sortedArr[position - 1]
                position -= 1
            }

            sortedArr[position] = value
        }
        
        return sortedArr[nums.count-1]
    }
    
    
    func searchRange(_ nums: [Int], _ target: Int) -> Int {
        
        if nums.count == 0 {
            return -1
        }
        var left = 0
        var right = nums.count - 1
      //  var temp = [Int]()
        while(left+1 < right) {
            let mid = (left + right) / 2 
            if(nums[mid] == target) {
              return mid
            } else if (nums[mid] < target){
                left = mid
            } else{
                right = mid
            }
        }
        
        if(nums[left] == target) {
            return left
        }
        if(nums[right] == target) {
            return right
        }
        return -1
       }
}

