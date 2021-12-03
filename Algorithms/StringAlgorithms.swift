
import Foundation

class StringAlgorithms {
    
    func palindrome(orignal: String) -> Bool {
        
        let original_letters = sanitize(original: orignal)
        return original_letters == String(original_letters.reversed())
        
    }
    
    private func sanitize(original: String) -> String {
        
        return original.lowercased().replacingOccurrences(of: "[^a-Z]+", with: "",options: .regularExpression)
    }
    
    
    func palindrome_recurse(_ valueString: String) -> Bool {
        
       let value = sanitize(original: valueString)
        
        guard value.count >= 2 else{
            return true
        }
        let end = value.index(value.endIndex, offsetBy: -1)
//        print("new string \(String(value[value.startIndex..<end]))")

        if value[value.startIndex] == value[end] {
            let start = value.index(value.startIndex, offsetBy: 1)
            return palindrome_recurse(String(value[start..<end]))
        } else{
            return false
        }
        
    }
    
    func getNamesinCaps(name: String) -> String {
        return name.filter{
            $0.isLetter
        }
        .uppercased()
    }
}
