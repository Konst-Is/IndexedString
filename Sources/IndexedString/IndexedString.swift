import Foundation

public extension String {
    
    var fromUnicodeScalars: String {
        var str = "\""
        for symbol in self.utf16 {
            str = str + "\\u{" + String(symbol, radix: 16) + "}"
        }
        return str + "\""
    }

    var extendedGraphemeClusters: String {
        var str = ""
        for char in self {
            str += "["
            for symbol in char.utf16 {
                str = str + "\\u{" + String(symbol, radix: 16) + "}"
            }
            str += "]"
        }
        return str.replacingOccurrences(of: "][", with: "] - [")
    }
    
    subscript(index: Int) -> String {
        get {
            guard !isEmpty, (0..<count).contains(index) else { return "" }
            return self.map { String($0) }[index]
        }
        
    }

    func firstIndex(of symbol: String) -> Int? {
        guard !isEmpty, symbol.count == 1 else { return nil }
        var index: Int? = nil
        for (i, char) in self.enumerated() {
            if String(char) == symbol {
                index = i
                break
            }
        }
        return index
    }
    
    func getSubstring(from index1: Int, to index2: Int) -> String {
        guard !isEmpty, (0..<index2).contains(index1), (index1..<count).contains(index2) else { return "" }
        var substring = ""
        for (i, char) in self.enumerated() where (index1...index2).contains(i) {
            substring += String(char)
        }
        return substring
    }
    
    @discardableResult
    mutating func removeSubrange(from index1: Int, to index2: Int) -> String {
        guard !isEmpty, (0..<index2).contains(index1), (index1..<count).contains(index2) else { return "" }
        var str = ""
        var substring = ""
        for (i, char) in self.enumerated() {
            if (index1...index2).contains(i) {
                substring += String(char)
            } else {
                str += String(char)
            }
        }
        self = str
        return substring
    }
    
    @discardableResult
    mutating func replaceSubrange(from index1: Int, to index2: Int, with str: String) -> String {
        guard !isEmpty, (0..<index2).contains(index1), (index1..<count).contains(index2) else { return "" }
        var leftStr = ""
        var rightStr = ""
        var substring = ""
        for (i, char) in self.enumerated() {
            switch i {
            case 0..<index1: leftStr += String(char)
            case (index1...index2): substring += String(char)
            case (index2..<count): rightStr += String(char)
            default: break
            }
        }
        self = leftStr + str + rightStr
        return substring
    }
    
    mutating func insert(by index: Int, str: String) {
        guard !isEmpty, (0..<count).contains(index) else { return self }
        var tempStr = ""
        for (i, char) in self.enumerated() {
            if i == index {
                tempStr += str
            }
            tempStr += String(char)
        }
        self = tempStr
    }
    
    func splitIntoChunks(thick: Int) -> [String] {
        guard !isEmpty, thick > 0 else { return [] }
        guard thick <= count else { return [self] }
        var chunks: [String] = []
        var i = 0
        var tempStr = ""
        for char in self {
            i += 1
            tempStr += String(char)
            if i == thick {
                chunks.append(tempStr)
                tempStr = ""
                i = 0
            }
        }
        if !tempStr.isEmpty {
            chunks.append(tempStr)
        }
        return chunks
    }
    
}
