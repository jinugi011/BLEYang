import UIKit

//Escaping //Non Escaping

//protocal
//able, delegate

func getName(_ Name : String) -> String {
    return "name : \(Name)"
}

var getNameClosure : (String) -> String

func sayHello(getName:(String) -> String, name  : String) -> String {
    return getName(name)
}


let ResultOne  = sayHello(getName: getName(_:), name: "YANG")


let namubers = [1,2,3,4,4,5,6,7]

let StringNumbers = namubers.map { (aNumbaer : Int) -> String in
    return "\(aNumbaer)"
}


let even : [Int] = namubers.filter { (aNmuber : Int) in
    return aNmuber % 2 == 0
    
}


let order  = namubers.sorted()

let descending = namubers.sorted(by: >)


