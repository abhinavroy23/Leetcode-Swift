import UIKit

/*
 
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 
 
 Example 1:
 
 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]
 
 Output
 [null,null,null,null,-3,null,0,-2]
 
 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
 
 
 Constraints:
 
 Methods pop, top and getMin operations will always be called on non-empty stacks.
 
 */


class MinStack {
    
    /** initialize your data structure here. */
    private var array : [Int] = [Int]()
    private var min : [Int] = [Int]()
    
    func push(_ x: Int) {
        array.append(x)
        if let m = min.last, m < x{
            min.append(m)
        }else{
            min.append(x)
        }
    }
    
    func pop() {
        if array.count > 0{
            array.removeLast()
            min.removeLast()
        }
    }
    
    func top() -> Int {
        return array.last!
    }
    
    func getMin() -> Int {
        return min.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
