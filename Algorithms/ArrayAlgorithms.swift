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
}
