import UIKit

/*
 
 36. Valid Sudoku - Medium
 
 Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
 
 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 
 A partially filled sudoku which is valid.
 
 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 
 Example 1:
 
 Input:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: true
 Example 2:
 
 Input:
 [
 ["8","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being
 modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 Note:
 
 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
 The given board contain only digits 1-9 and the character '.'.
 The given board size is always 9x9.
 
 */


class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        //check rows & Columns
        for i in 0..<9{
            var setR : Set<Character> = Set<Character>()
            var setC : Set<Character> = Set<Character>()
            for j in 0..<9{
                let elementR : Character = board[i][j]
                if elementR != Character("."){
                    if !setR.contains(elementR){
                        setR.insert(elementR)
                    }else{
                        return false
                    }
                }
                let elementC : Character = board[j][i]
                if elementC != Character("."){
                    if !setC.contains(elementC){
                        setC.insert(elementC)
                    }else{
                        return false
                    }
                }
            }
        }
        
        //Check submatrices of count 9 each
        for rowM in stride(from: 0, to: 9, by: 3){
            for colM in stride(from: 0, to: 9, by: 3){
                var set : Set<Character> = Set<Character>()
                for i in 0+rowM..<3+rowM{
                    for j in 0+colM..<3+colM{
                        let element : Character = board[i][j]
                        if element != Character("."){
                            if !set.contains(element){
                                set.insert(element)
                            }else{
                                return false
                            }
                        }
                    }
                }
            }
        }
        
        return true
    }
}
