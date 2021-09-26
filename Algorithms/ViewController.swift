

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sol = Solution()
        let arr = [1,3,5,23,21,98,87,32,10,89,100]

        // let pos = sol.search(arr, 3)
        
        let pos = sol.findPeakElement(nums: arr)
        print(pos)

        // Do any additional setup after loading the view.
    }

}


class Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        let n = nums.count
        
        let pivot = findPivot(in: nums, low: 0, high: n-1)
        
        if pivot == -1 {
            return binarySearch(in: nums, low: 0, high: n-1,key: target)
        }
        if (nums[pivot] == target) {    return pivot }
        
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
    
    
    func binarySearch(in arr: [Int], low: Int, high: Int, key: Int) -> Int {
        
        if high < low { return -1 }
        
        let mid = ((high + low) / 2)
        
        if (key == arr[mid])    {   return mid  }
       
        if (key > arr[mid]) {
          return  binarySearch(in: arr, low: mid+1, high: high, key: key)
        }
        
        return  binarySearch(in: arr, low: low, high: mid - 1, key: key)
    }
    
    
    func findPeakElement(nums: [Int]) -> Int {
        return insertionSort(nums: nums)
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
    
}

