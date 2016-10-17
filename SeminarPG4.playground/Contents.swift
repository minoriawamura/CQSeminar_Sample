//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let labelN = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
labelN.backgroundColor = UIColor.orange

extension UIColor {
    class func lightGreenColor() -> UIColor {
        let lightGreenColor = UIColor(red: 201 / 255, green: 255 / 255, blue: 101 / 255, alpha: 1.0)
        return lightGreenColor
    }
    
    class func grapeColor () -> UIColor {
        return UIColor(red: 0.5, green: 0, blue: 1.0, alpha: 1.0)
    }
}

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
label.backgroundColor = UIColor.lightGreenColor()
label.textColor = UIColor.purple

label.text = "LightGreen"

// ジェネリクス

// 型限定のSwap関数

func swapInt( _ a: inout Int, _ b: inout Int) {
    let tempa = a
    a = b
    b = tempa
}

// ジェネリクスのSwap関数

func swapValue<T>( _ a: inout T, _ b: inout T) {
    let tempa = a
    a = b
    b = tempa
}

var inta = 3
var intb = 99


swapInt(&inta, &intb)

print ("inta = \(inta), intb = \(intb)")

swapValue(&inta, &intb)

print ("inta = \(inta), intb = \(intb)")

var stra = "aaa"
var strb = "bbbb"

swapValue(&stra, &strb)

print("stra = \(stra), strb = \(strb)")

// 型指定の構造体
struct StackString {
    var stacks = [String]()
    
    mutating func push(item: String) {
        stacks.append(item)
    }
    
    mutating func pop() -> String {
        return stacks.removeLast()
    }
}

var weekStack = StackString()

weekStack.push(item: "Sunday")
weekStack.push(item: "Monday")
weekStack.push(item: "Tuesday")
print(weekStack)
weekStack.pop()
print(weekStack)

// ジェネリクス型の構造体

struct Stack<Youso> {
    var stacks = [Youso]()
    
    mutating func push(item: Youso) {
        stacks.append(item)
    }
    
    mutating func pop() -> Youso {
        return stacks.removeLast()
    }
}

var stackOfInt = Stack<Int>()
stackOfInt.push(item: 3)
stackOfInt.push(item: 5)
stackOfInt.push(item: 135)
print(stackOfInt)
stackOfInt.pop()
print(stackOfInt)

enum Direction {
    case Nortth, East, West, South
}

var stackOfDirection = Stack<Direction>()
stackOfDirection.push(item: .South)
stackOfDirection.push(item: .East)
stackOfDirection.push(item: .South)
stackOfDirection.push(item: .West)
print(stackOfDirection)
stackOfDirection.pop()
print(stackOfDirection)

var stackOfWeek = Stack<String>()
stackOfWeek.push(item: "日曜日")
stackOfWeek.push(item: "月曜日")
stackOfWeek.push(item: "火曜日")
print(stackOfWeek)
stackOfWeek.pop()
print(stackOfWeek)

