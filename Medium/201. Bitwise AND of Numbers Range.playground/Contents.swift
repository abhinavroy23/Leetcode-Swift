import UIKit

/*
 
 Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.
 
 Example 1:
 
 Input: [5,7]
 Output: 4
 Example 2:
 
 Input: [0,1]
 Output: 0
 
 */

class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m==n{
            return m
        }
        func findMSBPos(_ num : Int) -> Int{
            var res : Int = -1
            var input : Int = num
            while input > 0 {
                input = input >> 1
                res = res + 1
            }
            return res
        }
        
        var res : Int = 0
        var ip1 : Int = m
        var ip2 : Int = n
        while ip1 > 0 && ip2 > 0 {
            let a = findMSBPos(ip1)
            let b = findMSBPos(ip2)
            
            if a != b{
                break
            }
            
            res = res + (1 << a)
            
            ip1 = ip1 - (1 << a)
            ip2 = ip2 - (1 << a)
        }
        
        return res
    }
}
