import Foundation

enum Juice {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberrybananaJuice, mangoKiwiJuice
}

struct JuiceMaker {
    
    static private(set) var strawberry: UInt = 10
    static private(set) var banana: UInt = 10
    static private(set) var pineapple: UInt = 10
    static private(set) var kiwi: UInt = 10
    static private(set) var mango: UInt = 10
    
    var fruitsArray: [UInt] = [strawberry, banana, pineapple, kiwi, mango]
    
    
    var juice: Juice = Juice.bananaJuice
    
    mutating func makeJuice() {
        switch juice {
        case .strawberryJuice:
            fruitsArray[0] -= 16
        case .bananaJuice:
            fruitsArray[1] -= 2
        case .pineappleJuice:
            fruitsArray[2] -= 2
        case .kiwiJuice:
            fruitsArray[3] -= 3
        case .mangoJuice:
            fruitsArray[4] -= 3
        case .strawberrybananaJuice:
            fruitsArray[0] -= 10
            fruitsArray[1] -= 1
        case .mangoKiwiJuice:
            fruitsArray[4] -= 2
            fruitsArray[3] -= 1
        }
        print(fruitsArray)
    }
    mutating func plusStock() {
        
            switch fruitsArray {
            case [0]:
                fruitsArray[0] += 1
            case [1]:
                fruitsArray[1] += 1
            case [2]:
                fruitsArray[2] += 1
            case [3]:
                fruitsArray[3] += 1
            default:
                fruitsArray[4] += 1
            }
           
        }
   
   
}



