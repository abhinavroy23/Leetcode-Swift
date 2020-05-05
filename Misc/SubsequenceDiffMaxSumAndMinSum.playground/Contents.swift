import UIKit


/**
 * Sum of subsequence
 * You are required to determine the difference between the maximum subsequence sum and the minimum subsequence sum. Both the sums must consist at least one item.
 *
 * Sample input     sample output        Exp
 *  [2,2,2,2]           6               max - [2,2,2,2] -> 8, min - [2] -> 2, 8-2 = 6 answer
 *  [-3,-1,4]           8               max - [4], min - [-3,-1], 4-(-4) = 8 answer
 *
 */

func diffSubArray(_ nums : [Int]){
    guard nums.count > 0 else{
        return
    }
    
    var maxSum : Int = nums[0]
    var minSum : Int = nums[0]
    
    var maxDp : [Int] = Array(repeating: 0, count: nums.count)
    var minDp : [Int] = Array(repeating: 0, count: nums.count)
    maxDp[0] = nums[0]
    minDp[0] = nums[0]
    
    for i in 1..<nums.count{
        maxDp[i] = max(nums[i],nums[i]+maxDp[i-1])
        minDp[i] = min(nums[i],nums[i]+minDp[i-1])
        maxSum = max(maxSum,maxDp[i])
        minSum = min(minSum,minDp[i])
    }
    print(maxSum-minSum)
}

diffSubArray([-3,-1,4])
diffSubArray([2,2,2,2])
diffSubArray([])
diffSubArray([-6,-1,-4,-8,-4,-6,-1,-9,-1,-9])
diffSubArray([-7,1,-4,2,-7,0,-7,9,-1,1])
diffSubArray([0,7,5,-7,2,8,-9,3,7,-3])
diffSubArray([-4,5,2,2,8,0,5,-1,9,7])

