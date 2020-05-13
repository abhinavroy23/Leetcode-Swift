import UIKit

/*
 39. Combination Sum - Medium
 
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
 [7],
 [2,2,3]
 ]
 Example 2:
 
 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
 [2,2,2,2],
 [2,3,3],
 [3,5]
 ]
 
 */

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result : [[Int]] = [[Int]]()
        guard candidates.count > 0 else {
            return result
        }
        var combination : [Int] = [Int]()
        combinationDFS(candidates.sorted(), &result, &combination, target, 0)
        return result
    }
    
    func combinationDFS(_ candidates : [Int],_ results : inout [[Int]],_ combination : inout [Int],_ target : Int,_ startIndex : Int){
        if target == 0{
            results.append(combination)
        }
        
        for i in startIndex..<candidates.count{
            if candidates[i] > target{
                break
            }
            
            combination.append(candidates[i])
            combinationDFS(candidates, &results, &combination, target-candidates[i], i)
            combination.remove(at: combination.count - 1)
        }
    }
}
