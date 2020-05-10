import UIKit

/*
 
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
 
 Note that after backspacing an empty text, the text will continue empty.
 
 Example 1:
 
 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 Example 2:
 
 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 Example 3:
 
 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 Example 4:
 
 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 Note:
 
 1 <= S.length <= 200
 1 <= T.length <= 200
 S and T only contain lowercase letters and '#' characters.
 Follow up:
 
 Can you solve it in O(N) time and O(1) space?
 
 */

class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var firstResult : [Character] = []
        var secondResult : [Character] = []
        for i in 0..<S.count{
            let char = Array(S)[i]
            if char == Character("#"){
                if (i-1) >= 0 && firstResult.count > 0{
                    firstResult.removeLast()
                }
            }else{
                firstResult.append(char)
            }
        }
        
        for i in 0..<T.count{
            let char = Array(T)[i]
            if char == Character("#"){
                if (i-1) >= 0 && secondResult.count > 0{
                    secondResult.removeLast()
                }
            }else{
                secondResult.append(char)
            }
        }
        
        
        return String(firstResult) == String(secondResult)
    }
}
