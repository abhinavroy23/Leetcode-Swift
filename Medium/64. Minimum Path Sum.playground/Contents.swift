import UIKit

/*
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 
 Example:
 
 Input:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let row : Int = grid.count
        let col : Int = grid[0].count
        var grid = grid
        
        for i in 0..<row{
            for j in 0..<col{
                
                //For 0th row and 0th col, continue
                if i == 0 && j == 0{
                    continue
                }
                
                //for 0th row, sum the upper item and continue
                if i == 0{
                    grid[0][j] = grid[0][j] + grid[0][j-1]
                    continue
                }
                
                //for 0th col, sum the left item and continue
                if j == 0{
                    grid[i][0] = grid[i][0] + grid[i-1][0]
                    continue
                }
                
                //Handle the central cells
                grid[i][j] = grid[i][j] + min(grid[i-1][j],grid[i][j-1])
            }
        }
        return grid[row-1][col-1]
    }
}
