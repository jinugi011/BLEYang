import UIKit


struct Mypet {
    
    var title : String = "Title"
    private (set) var name : String = "이름없음"
    
    mutating func setName(to NewName : String) {
        self.name = NewName
    }
    
}

var myPet = Mypet()

myPet.name
myPet.title

myPet.title = "gkdlfs"

myPet.title

//myPet.name = "dfsfs"
