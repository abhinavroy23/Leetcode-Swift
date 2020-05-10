import UIKit

/*
 
 binary matrix means that all elements are 0 or 1. For each individual row of the matrix, this row is sorted in non-decreasing order.
 Given a row-sorted binary matrix binaryMatrix, return leftmost column index(0-indexed) with at least a 1 in it. If such index doesn't exist, return -1.
 You can’t access the Binary Matrix directly. You may only access the matrix using a BinaryMatrix interface:
 BinaryMatrix.get(x, y) returns the element of the matrix at index (x, y) (0-indexed).
 BinaryMatrix.dimensions() returns a list of 2 elements [m, n], which means the matrix is m * n.
 Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer. Also, any solutions that attempt to circumvent the judge will result in disqualification.
 For custom testing purposes you’re given the binary matrix mat as input in the following four examples. You will not have access the binary matrix directly.
 Example 1:
 
 Input: mat = [[0,0],[1,1]]
 Output: 0
 Example 2:
 
 Input: mat = [[0,0],[0,1]]
 Output: 1
 Example 3:
 
 Input: mat = [[0,0],[0,0]]
 Output: -1
 Example 4:
 
 Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
 Output: 1
 
 */

/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class BinaryMatrix {
 *     public func get(_ row: Int, _ col: Int) -> Int {}
 *     public func dimensions() -> [Int] {}
 * };
 */

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        let dim = binaryMatrix.dimensions()
        let row : Int = dim[0]
        let col : Int = dim[1]
        
        var index : Int = -1
        var r : Int = 0
        var c : Int = col-1
        while r < row && c >= 0 {
            if binaryMatrix.get(r,c) == 1{
                index = c
                c = c - 1
            }else{
                r = r + 1
            }
        }
        return index
    }
}
