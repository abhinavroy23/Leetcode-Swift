import UIKit

/*
 41. First Missing Positive - Hard
 
Given an unsorted integer array, find the smallest missing positive integer.

Example 1:

Input: [1,2,0]
Output: 3
Example 2:

Input: [3,4,-1,1]
Output: 2
Example 3:

Input: [7,8,9,11,12]
Output: 1
Note:

Your algorithm should run in O(n) time and uses constant extra space.
 
 */

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var bool : [Bool] = Array(repeating: false, count: nums.count+1)
        for num in nums{
            if num > 0 && num <= nums.count{
                bool[num] = true
            }
        }
        for i in 1..<bool.count{
            if bool[i] == false{
                return i
            }
        }
        return bool.count
    }
}

print(Solution().firstMissingPositive([0,2,3,1,6]))

