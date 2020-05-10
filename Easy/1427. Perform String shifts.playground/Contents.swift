import UIKit

/*
 
 You are given a string s containing lowercase English letters, and a matrix shift, where shift[i] = [direction, amount]:
 direction can be 0 (for left shift) or 1 (for right shift).
 amount is the amount by which string s is to be shifted.
 A left shift by 1 means remove the first character of s and append it to the end.
 Similarly, a right shift by 1 means remove the last character of s and add it to the beginning.
 Return the final string after all operations.
 
 Example 1:
 Input: s = "abc", shift = [[0,1],[1,2]]
 Output: "cab"
 Explanation:
 [0,1] means shift to left by 1. "abc" -> "bca"
 [1,2] means shift to right by 2. "bca" -> "cab"
 Example 2:
 Input: s = "abcdefg", shift = [[1,1],[1,1],[0,2],[1,3]]
 Output: "efgabcd"
 Explanation:
 [1,1] means shift to right by 1. "abcdefg" -> "gabcdef"
 [1,1] means shift to right by 1. "gabcdef" -> "fgabcde"
 [0,2] means shift to left by 2. "fgabcde" -> "abcdefg"
 [1,3] means shift to right by 3. "abcdefg" -> "efgabcd"
 
 Constraints:
 1 <= s.length <= 100
 s only contains lower case English letters.
 1 <= shift.length <= 100
 shift[i].length == 2
 0 <= shift[i][0] <= 1
 0 <= shift[i][1] <= 100
 
 */

class Solution {
    
    enum Shift{
        case none
        case left
        case right
    }
    
    /* Normal method - O(n*finalShift) */
    //     func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    //         guard s.count > 0 else{
    //             return s
    //         }
    
    //         var leftShiftCount : Int = 0
    //         var rightShiftCount : Int = 0
    
    //         for operation in shift{
    //             if operation[0] == 0{
    //                 leftShiftCount = leftShiftCount + operation[1]
    //             }else if operation[0] == 1{
    //                 rightShiftCount = rightShiftCount + operation[1]
    //             }
    //         }
    
    //         var finalShift : Int = 0
    //         var shiftType : Shift = .none
    
    //         if leftShiftCount > rightShiftCount {
    //             finalShift = leftShiftCount - rightShiftCount
    //             shiftType = .left
    //         }else if rightShiftCount > leftShiftCount{
    //             finalShift = rightShiftCount - leftShiftCount
    //             shiftType = .right
    //         }else{
    //             return s
    //         }
    
    //         finalShift = finalShift % s.count
    
    //         var arr : [Character] = Array(s)
    
    //         if shiftType == .left{
    //             let subArr = Array(arr[0..<finalShift])
    //             for i in finalShift..<arr.count{
    //                 arr[i-finalShift] = arr[i]
    //             }
    //             for i in (arr.count - finalShift)..<arr.count{
    //                 arr[i] = subArr[i-(arr.count - finalShift)]
    //             }
    //             return String(arr)
    //         }else if shiftType == .right{
    //             let subArr = Array(arr[(arr.count-finalShift)..<arr.count])
    //             for i in stride(from: arr.count-1-finalShift, through:0, by: -1){
    //                 arr[i+finalShift] = arr[i]
    //             }
    //             for i in 0..<finalShift{
    //                 arr[i] = subArr[i]
    //             }
    //             return String(arr)
    //         }
    //         return s
    //     }
    
    /* Reverse method - O(n) */
    func stringShift(_ s: String, _ shift: [[Int]]) -> String {
        guard s.count > 0 else{
            return s
        }
        
        var leftShiftCount : Int = 0
        var rightShiftCount : Int = 0
        
        for operation in shift{
            if operation[0] == 0{
                leftShiftCount = leftShiftCount + operation[1]
            }else if operation[0] == 1{
                rightShiftCount = rightShiftCount + operation[1]
            }
        }
        
        var finalShift : Int = 0
        var shiftType : Shift = .none
        
        if leftShiftCount > rightShiftCount {
            finalShift = leftShiftCount - rightShiftCount
            shiftType = .left
        }else if rightShiftCount > leftShiftCount{
            finalShift = rightShiftCount - leftShiftCount
            shiftType = .right
        }else{
            return s
        }
        
        finalShift = finalShift % s.count
        
        var arr : [Character] = Array(s)
        
        if shiftType == .left{
            var subArr : [Character] = Array(arr[0..<finalShift]).reversed()
            var subArr2 : [Character] = Array(arr[finalShift..<arr.count]).reversed()
            subArr.append(contentsOf: subArr2)
            return String(subArr.reversed())
        }else if shiftType == .right{
            let d = s.count - finalShift
            var subArr : [Character] = Array(arr[0..<d]).reversed()
            var subArr2 : [Character] = Array(arr[d..<arr.count]).reversed()
            subArr.append(contentsOf: subArr2)
            return String(subArr.reversed())
        }
        return s
    }
    
}
