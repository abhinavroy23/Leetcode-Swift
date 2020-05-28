import UIKit

/*
 946. Validate Stack Sequences - Medium
 
 Given two sequences pushed and popped with distinct values, return true if and only if this could have been the result of a sequence of push and pop operations on an initially empty stack.

  

 Example 1:

 Input: pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
 Output: true
 Explanation: We might do the following sequence:
 push(1), push(2), push(3), push(4), pop() -> 4,
 push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
 Example 2:

 Input: pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
 Output: false
 Explanation: 1 cannot be popped before 2.
  

 Note:

 0 <= pushed.length == popped.length <= 1000
 0 <= pushed[i], popped[i] < 1000
 pushed is a permutation of popped.
 pushed and popped have distinct values.
 
 */

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        guard pushed.count > 0, popped.count > 0 else{
            return true
        }
        var arr : [Int] = [Int]()

        var i : Int = 0
        arr.append(pushed[i])
        i += 1
        var j : Int = 0
        //print("i = \(i) j = \(j) arr = \(arr)")
        while j < popped.count || i < pushed.count{
            if j < popped.count && arr.count > 0 && arr.last! == popped[j]{
                arr.removeLast()
                j += 1
            }else if i < pushed.count{
                arr.append(pushed[i])
                i += 1
            }else{
                return false
            }
            //print("i = \(i) j = \(j) arr = \(arr)")
        }
        return arr.count == 0
    }
}
