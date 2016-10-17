//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// 変数と定数
var str = "Hello, Michael"   // 変数

let publisher = "CQ出版社"

// 数値
let pi: Double = 10 / 3     // Double
let intPi : Int = 10 / 3    // Int
let charX : Character = "X" // Character
let name: String = "Awa"    // String
let uintNum: UInt32 = 8     // Unsigned Int
let truth: Bool = true      // Bool

Int.max
Int8.max
Int8.min
UInt.max
UInt8.max
UInt8.min
UInt64.max

// for 文の構文
var y = 0

for x in 1...10 {
    y += x
}

/*
// Swift3.0で使えなくなった構文
y = 0
for (var x = 1; x <= 10; x++ ) {
    y += x
}
*/

// グラフ表示

var v,t: Double
t = 0.0
repeat {
    v = sin(t)
    t += 0.1
} while t < 10.0

// 関数定義
// zeikomi() 関数を定義する
    // kakaku: 税抜き価格
    // zei: 税率 (%)
func zeikomi(kakaku: Int, zei: Int) -> Int {
    let zeiDouble = Double(100 + zei) / 100
    let zeikomiDouble = Double(kakaku) * zeiDouble
    return Int(zeikomiDouble)
}

// 関数の呼び出し
let seikyu = zeikomi(kakaku: 100, zei: 8)

// クラス定義
class Person {
    var familyName: String = ""
    var firstName: String = ""
    var male: Bool = true
    var age: Int = 0
    
    init() {
        familyName = ""
        firstName = ""
        male = true
        age = 0
    }
    init(sei: String, mei: String, otoko: Bool, nenrei: Int) {
        familyName = sei
        firstName = mei
        self.male = otoko
        age = nenrei
    }
    
    func fullName() -> String {
        return (familyName + " " + firstName)
    }
}

// クラスを使う
let taro = Person()
let hanako = Person(sei: "山田", mei: "花子", otoko: false, nenrei: 20)

taro.familyName = "河村"
taro.firstName = "太郎"
taro.age = 30

