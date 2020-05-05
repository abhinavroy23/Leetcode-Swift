import UIKit

/**
 * You are given an array, determine number of subarrays at each index such that minimum number in that subarrays is element at index i
 * <pre>
 * eg: {3, 2, 4, 1, 5}; should give 1,4,1,8,1
 * - 3 has only 1 subarray: {3}
 * - 2 has {3,2}{2,4}{2}
 * - 4 has only {4}
 * - 1 has 8: {3,2,4,1}{2,4,1}{4,1}{1}{1,5}{32415}{2415}{415}
 * - 5 has only {5}
 * </pre>
 *
 */

// Solution - O(n^3)
func subArray1(_ arr: [Int]) -> [Int]{
    func getAllSubArrays(_ arr : [Int]) -> [[Int]]{
        var result : [[Int]] = [[Int]]()
        for i in 0..<arr.count{
            for j in i..<arr.count{
                result.append(Array(arr[i...j]))
            }
        }
        return result
    }
    
    var arrays : [[Int]] = getAllSubArrays(arr)
    var result : [Int] = [Int]()
    for elem in arr{
        result.append(arrays.filter{ return $0.min()! == elem }.count)
    }
    return result
}

// Solution - O(n)
func subArray(_ arr : [Int]) -> [Int]{
    var result : [Int] = [Int]()
    for i in 0..<arr.count{
        var count : Int = 0
        
        var lind : Int = i
        
        var lc : Int = i
        while lc >= 0{
            if arr[lc...i].min()! == arr[i]{
                count += 1
                lind = lc
            }else{
                break
            }
            lc -= 1
        }
        
        
        while lind <= i{
            var rc : Int = i+1
            while rc < arr.count{
                if arr[lind...rc].min()! == arr[i]{
                    count += 1
                }else{
                    break
                }
                rc += 1
            }
            lind += 1
        }
        
        result.append(count)
    }
    return result
}
