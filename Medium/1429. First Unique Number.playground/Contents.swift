import UIKit

/*
 
 Given a string, find the first non-repeating character in it and return it’s index. If it doesn’t exist, return -1.
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 
 */

class FirstUnique {
    private var arr : [Int] = [Int]()
    private var countHash : [Int : Int] = [Int : Int]()
    
    init(_ nums: [Int]) {
        for num in nums{
            if let val = countHash[num]{
                countHash[num] = val + 1
            }else{
                arr.append(num)
                countHash[num] = 1
            }
        }
    }
    
    func showFirstUnique() -> Int {
        for elem in arr{
            if let val = countHash[elem], val == 1{
                return elem
            }
        }
        return -1
    }
    
    func add(_ value: Int) {
        if let val = countHash[value]{
            countHash[value] = val + 1
        }else{
            arr.append(value)
            countHash[value] = 1
        }
    }
}

/**
 * Your FirstUnique object will be instantiated and called as such:
 * let obj = FirstUnique(nums)
 * let ret_1: Int = obj.showFirstUnique()
 * obj.add(value)
 */
