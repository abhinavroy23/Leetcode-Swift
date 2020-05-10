import UIKit

/*

 Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:
 
 Any left parenthesis '(' must have a corresponding right parenthesis ')'.
 Any right parenthesis ')' must have a corresponding left parenthesis '('.
 Left parenthesis '(' must go before the corresponding right parenthesis ')'.
 '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
 An empty string is also valid.
 Example 1:
 Input: "()"
 Output: True
 Example 2:
 Input: "(*)"
 Output: True
 Example 3:
 Input: "(*))"
 Output: True
 Note:
 The string size will be in the range [1, 100].

 */

class Solution {
    
    /* take two stacks - failed for some test cases - O(n) */
    //     func checkValidString(_ s: String) -> Bool {
    //         class Stack{
    //             private var arr : [Character] = [Character]()
    //             func push(_ elem : Character){
    //                 arr.append(elem)
    //             }
    //             func pop(){
    //                 if arr.count > 0{
    //                     arr.remove(at: arr.count-1)
    //                 }
    //             }
    
    //             func top() -> Int{
    //                 if arr.count > 0{
    //                     return arr.count-1
    //                 }
    //                 return 0
    //             }
    
    //             func isEmpty() -> Bool{
    //                 return arr.count == 0
    //             }
    //         }
    
    //         let stack1 : Stack = Stack()
    //         let stack2 : Stack = Stack()
    
    //         for char in s{
    //             if char == Character("("){
    //                 stack1.push(char)
    //             }else if char == Character(")"){
    //                 if !stack1.isEmpty(){
    //                     stack1.pop()
    //                 }else{
    //                     if stack2.isEmpty(){
    //                         return false
    //                     }
    //                     stack2.pop()
    //                 }
    //             }else{
    //                 stack2.push(char)
    //             }
    //         }
    
    //         while !stack1.isEmpty(){
    //             if stack2.isEmpty(){
    //                 return false
    //             }
    //             if stack2.top() < stack1.top(){
    //                 return false
    //             }
    //             stack1.pop()
    //             stack2.pop()
    //         }
    //         return true
    //     }
    
    /* Greedy solution - take two pointer low and high - O(n) */
    func checkValidString(_ s: String) -> Bool {
        guard s.count > 0 else{
            return true
        }
        
        var low : Int = 0
        var high : Int = 0
        
        for char in s{
            if char == Character("("){
                low = low + 1
                high = high + 1
            }else if char == Character(")"){
                if low > 0{
                    low = low - 1
                }
                high = high - 1
            }else{
                if low > 0{
                    low = low - 1
                }
                high = high + 1
            }
            
            if high < 0{
                return false
            }
        }
        return low == 0
    }
}
