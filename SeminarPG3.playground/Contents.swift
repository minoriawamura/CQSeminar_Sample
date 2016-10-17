//: Playground - noun: a place where people can play

import UIKit

class Shoes {
    
    var size: Double
    var owner : String
    
    init () {
        size = 0
        owner = ""
    }
    
    init ( name: String, size: Double) {
        owner = name
        self.size = size
    }
    
}

class Sneaker: Shoes {
    
    var material : String
    var color: String
    
    override init() {
        material = ""
        color = "White"
        super.init()
    }
    
    init (material : String, color: String) {
        self.material = material
        self.color = color
        super.init()
    }
}

let mySneaker = Sneaker()
mySneaker.size = 25.0
mySneaker.owner = "Michael"

let yourSneaker = mySneaker
yourSneaker.material = "Canvas"

yourSneaker.size = 26.0

mySneaker.size

enum Size : String {
    case XS = "Extra Small"
    case S = "Small"
    case M = "Midium"
    case L = "Large"
    case XL = "Extra Large"
}

struct tShirt {
    static var material: String = "Cotton"
    var size: Size = .S
    var color: String = "White"
    var sleeve : String = "Short"
    
}

var myTShirt: tShirt
var yourTShirt: tShirt

myTShirt = tShirt(size: .L, color: "Black", sleeve: "Long")

yourTShirt = myTShirt

yourTShirt.size = .S

myTShirt.size
yourTShirt.size

print(yourTShirt.size.rawValue)

// 列挙を使うと取りうる値を全てカバーできる
switch myTShirt.size {
case .XS, .S :
    print("for ladies")
case .M, .L, .XL :
    print("for men")
}

let stringSize = "XS"

switch stringSize {
case "XS", "S" :
    print("for ladies")
case "M", "L", "XL" :
    print("for men")
default :
    break
}

