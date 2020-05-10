import UIKit

/*
 
 Given an array of strings, group anagrams together.
 
 Example:
 
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 Note:
 
 All inputs will be in lowercase.
 The order of your output does not matter.
 
 */


class Solution {
    //     func groupAnagrams(_ strs: [String]) -> [[String]] {
    //         func checkAnagram(_ str1 : String,_ str2 : String) -> Bool{
    //             var hashMap : [Character : Int] = [Character : Int]()
    //             for char in str1{
    //                 if let val = hashMap[char]{
    //                     hashMap[char] = val + 1
    //                 }else{
    //                     hashMap[char] = 1
    //                 }
    //             }
    
    //             for str in str2{
    //                 if let val = hashMap[str]{
    //                     hashMap[str] = val - 1
    //                 }else{
    //                     return false
    //                 }
    //             }
    
    //             for (_,value) in hashMap{
    //                 if value > 0{
    //                     return false
    //                 }
    //             }
    //             return true
    //         }
    
    //         var current : [String] = strs
    //         var result : [[String]] = []
    
    //         while !current.isEmpty {
    //             var tempArr : [String] = []
    //             let first = current.first!
    //             tempArr.append(first)
    //             current.remove(at: 0)
    
    //             var j = 0
    //             while j < current.count{
    //                 let first1 = current[j]
    //                 if checkAnagram(first, first1){
    //                     current.remove(at: j)
    //                     tempArr.append(first1)
    //                 }else{
    //                     j = j + 1
    //                 }
    //             }
    //             if tempArr.count > 0{
    //                 result.append(tempArr)
    //             }
    //         }
    //         return result
    //     }
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap : [String : [String]] = [String : [String]]()
        
        for str in strs{
            hashMap[String(str.sorted()), default:[]].append(str)
        }
        return Array(hashMap.values)
    }
}
