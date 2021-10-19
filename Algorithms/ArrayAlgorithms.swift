//
//  ArrayAlgorithms.swift
//  Algorithms
//
//

import Foundation
import UIKit

class ArrayAlgorithms
{
    
    func duplicateZeros(_ arr: inout [Int]) {
        
        var temp = 0
        while temp < arr.count {
            if arr[temp] == 0 {
                shiftElements(from: temp, &arr)
                temp += 1
            }
            temp += 1
           // print("duplicate \(arr)")
        }
    }
    
    
    func shiftElements(from pos: Int, _ arr: inout [Int]) {
        
        var temp = Array<Int>(repeating: 0, count: arr.count)
        
        temp[0...pos] = arr[0...pos]
        if pos+1 < arr.count{
            temp[pos+1] = 0
        }
        if pos+2 < arr.count{
            for i in (pos+2..<arr.count){
                temp[i] = arr[i-1] 
            }
        }
        arr = temp
    }
    
    func anotherDuplicateZeros(_ arr: inout [Int]) {
        var idx = 0
        let originalSize = arr.count
        
        while(idx < originalSize) {
            if arr[idx] == 0 {
                idx += 1
                arr.insert(0, at: idx)
            }
            idx += 1
        }
        arr.removeLast(arr.count - originalSize)
    }
    
    
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var max = 0
        for var i in (0 ..< nums.count){
            let (index,maxOnes) = findOnes(i, nums)
            if  maxOnes > max {
                max = maxOnes
            }
            i = index
        }
        return max
    }
    
    func findOnes(_ i: Int,_ nums: [Int]) -> (Int,Int) {
        var cons_ones = 0
        var index = i
        while(index < nums.count && nums[index] == 1){
            cons_ones += 1
            index += 1
        }
        return (index,cons_ones)
    }
    
    func anotherFindMaxConsecutiveOnes(_ nums: [Int]) -> Int {
     
        var current = 0
        var max = 0
        
        nums.forEach{ number in
            guard number == 1 else{
                if current > max {
                    max = current
                }
                current = 0
                return
            }
            current += 1
        }
        return current > max ? current : max
    }
    
    func findNumbers(_ nums: [Int]) -> Int {
    
        var evenNums = 0
        
        nums.forEach { numbs in
        
            var number = numbs
            number = number / 10
            var digits = 0
            while number >= 10 {
                digits += 1
                number = number / 10 
            }
            digits += 1
            if 1...9 ~= number {
                digits += 1
            }
            
            if (digits % 2 == 0) {
                evenNums += 1
            }
        }
        return evenNums
    }
    
    func sortedSquares(_ nums: [Int]) -> [Int] {
        
        var temp = Array(repeating: 0, count: nums.count)
        
        for (index,item) in nums.enumerated() {
            temp[index] = item * item
        }
        
        return temp.sorted()
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        let temp = nums1
        let total = m+n
        for (i,item) in nums1.enumerated().reversed() {
            if item == 0 && i == nums1.endIndex - 1 {
                nums1.removeLast()
            }
        }
        nums1.reserveCapacity(m+n)
        nums1.append(contentsOf: nums2)
        
        if nums1.count < total {
            let arr = temp.suffix(total-m)
            nums1.append(contentsOf: arr)
        }
        
       nums1 = nums1.sorted()
        
        
    }
    
    func binarySearch(_ arr: [Int], target num: Int) {
        
    }

}
