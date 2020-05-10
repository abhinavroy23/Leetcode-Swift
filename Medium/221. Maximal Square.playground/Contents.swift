import UIKit

/*
 
 Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
 
 Example:
 
 Input:
 
 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 
 Output: 4
 
 */

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 else{
            return 0
        }
        
        let rows : Int = matrix.count
        let cols : Int = matrix[0].count
        
        var aux : [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        //Fill the elements in first col
        for i in 0..<rows{
            aux[i][0] = Int(String(matrix[i][0]))!
        }
        
        //Fill the elements in first row
        for j in 0..<cols{
            aux[0][j] = Int(String(matrix[0][j]))!
        }
        
        //Fill other elements in aux array
        for i in 1..<rows{
            for j in 1..<cols{
                if matrix[i][j] == Character("1"){
                    aux[i][j] = min(aux[i-1][j],aux[i][j-1],aux[i-1][j-1]) + 1
                }
            }
        }
        
        // Find the max element in aux array i.e., the result
        var maxInAux : Int = 0
        for i in 0..<rows{
            for j in 0..<cols{
                if aux[i][j] > maxInAux{
                    maxInAux = aux[i][j]
                }
            }
        }
        
        return maxInAux * maxInAux
    }
}
