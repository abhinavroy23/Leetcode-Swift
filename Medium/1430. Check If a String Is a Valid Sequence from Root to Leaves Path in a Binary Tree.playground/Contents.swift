import UIKit

/*
 
 Given a binary tree where each path going from the root to any leaf form a valid sequence, check if a given string is a valid sequence in such binary tree.
 We get the given string from the concatenation of an array of integers arr and the concatenation of all values of the nodes along a path results in a sequence in the given binary tree.
 
 Example 1:
 
 Input:
 root = [0,1,0,0,1,0,null,null,1,0,0],
 arr = [0,1,0,1]
 Output: true
 Explanation:
 The path 0 -> 1 -> 0 -> 1 is a valid sequence
 (green color in the figure).
 Other valid sequences are:
 0 -> 1 -> 1 -> 0
 0 -> 0 -> 0
 
 Example 2:
 
 Input:
 root = [0,1,0,0,1,0,null,null,1,0,0],
 arr = [0,0,1]
 Output: false
 Explanation:
 The path 0 -> 0 -> 1 does not exist,
 therefore it is not even a sequence.
 
 Example 3:
 
 Input:
 root = [0,1,0,0,1,0,null,null,1,0,0],
 arr = [0,1,1]
 Output: false
 Explanation:
 The path 0 -> 1 -> 1 is a sequence,
 but it is not a valid sequence.
 
 Constraints:
 1 <= arr.length <= 5000
 0 <= arr[i] <= 9
 Each node's value is between [0 - 9].
 
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        return validSeqUtil(root,arr,0)
    }
    
    func validSeqUtil(_ root : TreeNode?,_ arr : [Int],_ index : Int) -> Bool{
        guard let root = root else{
            return arr.count == 0
        }
        
        if (nil == root.left && nil == root.right && index < arr.count &&
            root.val == arr[index] && root.val == arr[arr.count-1]){
            return true
        }
        
        return (index < arr.count &&
            root.val == arr[index] &&
            (validSeqUtil(root.left,arr,index+1) || validSeqUtil(root.right,arr,index+1)))
    }
}
