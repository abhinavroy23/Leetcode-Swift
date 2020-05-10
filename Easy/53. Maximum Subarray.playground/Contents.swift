import UIKit

/*
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:
 
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 */

class Solution {
    
    /* Naive solution - O(n^2) */
    // func maxSubArray(_ nums: [Int]) -> Int {
    //     var max : Int = 0
    //     for i in 0..<nums.count{
    //         for j in i..<nums.count{
    //             let range = i...j
    //             let sum = nums[range].reduce(0,+)
    //             if max < sum{
    //                 max = sum
    //             }
    //         }
    //     }
    //     return max
    // }
    
    /* Using Divide and conquer - O(nlogn) */
    //     func maxSubArray(_ nums : [Int]) -> Int{
    
    //         func maxSubArrayUtil(_ num : [Int],_ low : Int,_ high : Int) -> Int{
    //             if low == high{
    //                 return num[low]
    //             }
    
    //             let mid = (low + high)/2
    
    //             return max(maxSubArrayUtil(num, low, mid),
    //                        maxSubArrayUtil(num, mid+1, high),
    //                        maxSubArrayOverLapping(num, low, mid, high))
    //         }
    
    //         func maxSubArrayOverLapping(_ num : [Int],_ low : Int,_ mid: Int, _ high : Int) -> Int{
    //             var leftSum = Int.min
    //             for i in stride(from: mid, through: low, by: -1){
    //                 let sum = num[i...mid].reduce(0,+)
    //                 if leftSum < sum{
    //                     leftSum = sum
    //                 }
    //             }
    //             var rightSum = Int.min
    //             for i in stride(from: high, through: mid+1, by: -1){
    //                 let sum = num[(mid+1)...i].reduce(0,+)
    //                 if rightSum < sum{
    //                     rightSum = sum
    //                 }
    //             }
    //             return leftSum + rightSum
    //         }
    
    //         return maxSubArrayUtil(nums, 0, nums.count-1)
    //     }
    
    /* Using DP : Kadane's algo - O(n) */
    func maxSubArray(_ nums : [Int]) -> Int{
        if nums.count == 1{
            return nums[0]
        }
        var result : Int = nums[0]
        var dp : [Int] = Array(repeating: 0, count:nums.count)
        dp[0] = nums[0]
        
        for i in 1..<nums.count{
            dp[i] = max(nums[i],nums[i]+dp[i-1])
            result = max(result,dp[i])
        }
        return result
    }
}
