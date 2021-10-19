//
//  ArrayAlgorithms.swift
//  Algorithms
//
//

import Foundation

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

}
