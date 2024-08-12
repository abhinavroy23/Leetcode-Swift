class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {

        if numRows == 1 { return s }

        var input = Array(s)
        var maxIndex = numRows-1
        var indexArray : [(Int, Int)] = []
        
        var j = 0
        while !input.isEmpty {
            if j % maxIndex == 0 {
                for i in 0...maxIndex {
                    if !input.isEmpty {
                        let temp = input.removeFirst()
                        indexArray.append((i,j))
                    }
                }
            } else {
                let temp = input.removeFirst()
                indexArray.append(((maxIndex - (j % maxIndex)),j))
            }
            j += 1
        }
        
        var newInput = s
        var resultArray = Array(repeating: Array(repeating: "", count: j), count: numRows)
        
        for (left, right) in indexArray {
            resultArray[left][right] = String(newInput.removeFirst())
        }
        
        let resultString = resultArray.reduce("") { partialResult, tempArr in
            return partialResult + tempArr.joined()
        }
        
        return resultString
    }
}
