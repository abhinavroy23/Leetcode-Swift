import UIKit

/*
 
 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Example:
 
 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.
 
 Note: Please solve it without division and in O(n).
 
 Follow up:
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
 
 */

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else{
            return nums
        }
        
        var prod : [Int] = Array(repeating: 1, count: nums.count)
        var temp : Int = 1
        
        for i in 0..<nums.count{
            prod[i] = temp
            temp = temp * nums[i]
        }
        
        temp = 1
        
        for i in stride(from: nums.count-1, through: 0, by: -1){
            prod[i] = prod[i] * temp
            temp = temp * nums[i]
        }
        
        return prod
    }
}
