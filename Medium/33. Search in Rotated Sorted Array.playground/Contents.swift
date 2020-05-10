import UIKit

/*
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 Example 1:
 
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:
 
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 */


class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let low : Int = 0
        let high : Int = nums.count - 1
        let pivot = findPivot(nums,0,high)
        
        if pivot == -1{
            return binarySearch(nums,low,high,target)
        }
        
        if nums[pivot] == target{
            return pivot
        }
        
        if nums[0] <= target{
            return binarySearch(nums,0,pivot-1,target)
        }else{
            return binarySearch(nums,pivot+1,high,target)
        }
    }
    
    func findPivot(_ nums : [Int],_ low : Int,_ high : Int) -> Int{
        if high < low{
            return -1
        }
        if high == low{
            return low
        }
        let mid = (low + high)/2
        if mid < high && nums[mid] > nums[mid+1]{
            return mid
        }
        if mid > low && nums[mid] < nums[mid-1]{
            return mid-1
        }
        if nums[low] >= nums[mid]{
            return findPivot(nums,low,mid-1)
        }
        return findPivot(nums,mid+1,high)
    }
    
    func binarySearch(_ nums : [Int],_ low : Int,_ high : Int,_ key : Int) -> Int{
        if high < low{
            return -1
        }
        let mid = (low + high)/2
        if nums[mid] == key{
            return mid
        }else if nums[mid] > key{
            return binarySearch(nums,low,mid-1,key)
        }else{
            return binarySearch(nums,mid+1,high,key)
        }
    }
}
