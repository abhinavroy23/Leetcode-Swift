import UIKit

/*
 680. valid Palindrome II - Easy
 
 Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

 Example 1:
 Input: "aba"
 Output: True
 Example 2:
 Input: "abca"
 Output: True
 Explanation: You could delete the character 'c'.
 Note:
 The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
 
 */

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        func isPalindrome(_ arr : [Character],_ l : Int,_ h : Int) -> Bool{
            var low : Int = l
            var high : Int = h
            while low < high{
                if arr[low] != arr[high]{
                    return false
                }
                low += 1
                high -= 1
            }
            return true
        }


        var arr : [Character] = Array(s)
        var left : Int = 0
        var right : Int = s.count-1
        var skipCount : Int = 0

        while right > left{
            //print("left = \(left) & right = \(right) & l = \(arr[left]) & r = \(arr[right])")
            //print("skipcount = \(skipCount)")
            if arr[left] != arr[right]{
                if skipCount == 0 {
                    skipCount += 1
                    if arr[left] == arr[right-1] && isPalindrome(arr, left, right-1){
                        right -= 1
                        continue
                    }else if arr[right] == arr[left+1] && isPalindrome(arr, left+1, right){
                        left += 1
                        continue
                    }else{
                        return false
                    }
                }else{
                    return false
                }
            }
            left += 1
            right -= 1
        }
        return true
    }
}
