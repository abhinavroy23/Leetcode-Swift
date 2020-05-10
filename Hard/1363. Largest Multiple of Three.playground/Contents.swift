import UIKit

/*
 
 1363. Largest Multiple of Three - Hard
 
 Given an integer array of digits, return the largest multiple of three that can be formed by concatenating some of the given digits in any order.
 
 Since the answer may not fit in an integer data type, return the answer as a string.
 
 If there is no answer return an empty string.
 
 
 
 Example 1:
 
 Input: digits = [8,1,9]
 Output: "981"
 Example 2:
 
 Input: digits = [8,6,7,1,0]
 Output: "8760"
 Example 3:
 
 Input: digits = [1]
 Output: ""
 Example 4:
 
 Input: digits = [0,0,0,0,0,0]
 Output: "0"
 
 
 Constraints:
 
 1 <= digits.length <= 10^4
 0 <= digits[i] <= 9
 The returning answer must not contain unnecessary leading zeros.
 
 */

class Solution {
    func largestMultipleOfThree(_ digits: [Int]) -> String {
        guard digits.reduce(0,+) != 0 else{
            return "0"
        }
        var digs = digits.sorted()
        var idx_one1 : Int = -1
        var idx_one2 : Int = -1
        var idx_two1 : Int = -1
        var idx_two2 : Int = -1
        var sum : Int = 0
        for i in stride(from: digs.count-1, through: 0, by: -1){
            sum = sum + digs[i]
            if digs[i] % 3 == 1{
                idx_one2 = idx_one1
                idx_one1 = i
            }
            if digs[i] % 3 == 2{
                idx_two2 = idx_two1
                idx_two1 = i
            }
        }
        
        //("\(idx_one1) \(idx_one2) \(idx_two1) \(idx_two2)")
        
        if sum % 3 == 1{
            if idx_one1 != -1{
                digs[idx_one1] = -1
            }else{
                digs[idx_two1] = -1
                digs[idx_two2] = -1
            }
        }else if sum % 3 == 2{
            if idx_two1 != -1{
                digs[idx_two1] = -1
            }else{
                digs[idx_one1] = -1
                digs[idx_one2] = -1
            }
        }
        //print("digs = \(digs)")
        return digs.filter{ return $0 != -1}.map{return "\($0)"}.reversed().joined()
    }
}
