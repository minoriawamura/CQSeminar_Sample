//: Playground - noun: a place where people can play

// たプル、配列、辞書

import UIKit

// タプル

let memopad: (name: String, kakaku: Int, zei: Int) = ("メモ帳", 300, 24)

func sougaku(shohin: (String, Int, Int), kosu: Int) -> Int {
    return (shohin.1 + shohin.2) * kosu
}

let seikyu = sougaku(shohin: memopad, kosu: 3)


// 配列

let week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

let monday = week[1]
let yousosuu = week.count

var shuu = [String]()

for day in week {
    
    switch day {
    case "Sun" :
        shuu.append("日曜日")
    case "Mon" :
        shuu.append("月曜日")
    case "Tue" :
        shuu.append("火曜日")
    case "Wed" :
        shuu.append("水曜日")
    case "Thu" :
        shuu.append("木曜日")
    case "Fri" :
        shuu.append("金曜日")
    case "Sat" :
        shuu.append("土曜日")
    default :
        break
    }
    print(shuu)
}

// ２次元配列
var nestedArray = [["a1", "a2", "a3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]]
let centerValue = nestedArray[1][1]
var array2 = nestedArray
array2.append(["d1", "d2", "d3", "d4"])
array2[3][0] = "xx"
print(array2[3])

// ２次元配列の全要素を取り出す
for arrayouter in nestedArray {
    for element in arrayouter {
        print(element)
    }
}

// セット
var favoriteMusic: Set<String> = ["Rock", "Country", "Classical"]

print(favoriteMusic.count)

favoriteMusic.insert("Jazz")

for music in favoriteMusic {
    print ("I can play \(music) music")
}

if favoriteMusic.contains("Hip hop") {
    print("I can play Hip hop")
} else {
    print("I can not play Hip hop")
}

var playableMusic: Set = ["Rock", "Country", "Pop"]

favoriteMusic.intersection(playableMusic)
favoriteMusic.symmetricDifference(playableMusic)
favoriteMusic.union(playableMusic)
favoriteMusic.subtract(playableMusic)

// 辞書

let metro = ["G": "銀座線", "M": "丸ノ内線", "H": "日比谷線", "T": "東西線", "C": "千代田線",
             "Z": "半蔵門線", "N": "南北線", "F": "副都心線"]
var eidan = metro
eidan["Y"] = "有楽町線"
eidan["O"] = "大江戸線"
print(eidan)

eidan.removeValue(forKey: "O")

print(eidan)

for (sign, name) in eidan {
    print("\(sign) は \(name) です")
}

// 辞書の値が辞書

var tShirt = ["S": 1000, "M": 1200, "L": 1500, "LL": 1800]
var poloShirt = ["S": 2000, "M": 2500, "L": 3000 ]
var skirt = ["S": 3000, "M": 4000, "L": 5000]
var sweatPants = ["S": 2700, "M": 3200, "L": 4000, "LL": 5000]

var shohin = ["tShirt": tShirt, "poloShirt": poloShirt, "skirt": skirt, "sweatPants": sweatPants]

func getPrice(hinmoku: String, size: String) -> Int {
    let hinmokujisho = shohin[hinmoku]
    let kingaku = hinmokujisho![size]
    return kingaku!
}

let goukei = getPrice(hinmoku: "tShirt", size: "M") + getPrice(hinmoku: "skirt", size: "M")

// getPrice　関数はエラーが発生する

// オプショナルバインディングで対処する
func price(hinmoku: String, size: String) -> Int {
    if let hinmokujisho = shohin[hinmoku] {
        if let kingaku = hinmokujisho[size] {
            return kingaku
        } else {
            print("そのサイズはありません")
            return 0
        }
    } else {
        print("その商品はありません")
        return 0
    }
}

let order = [("skirt", "S"), ("tShirt", "M"), ("suit", "S"), ("poloShirt", "L"), ("skirt", "LL")]

var uriage = 0
for (hinmoku, size) in order {
    uriage += price(hinmoku: hinmoku, size: size)
}

print(uriage)

// オプショナル

var nextOrder: [(String, String)] = []

var optionalvalue: Int?
var nonOptonalValue : Int

optionalvalue = uriage
print(optionalvalue)



nonOptonalValue = Int(Double(uriage) * 1.08)

nonOptonalValue = 0

// オプショナル値のままでは演算できない
// nonOptonalValue = Int(Double(optionalvalue) * 1.08)

// アンラップ
nonOptonalValue = Int(Double(optionalvalue!) * 1.08)

optionalvalue = nil

// nil をアンラップするとエラー
// nonOptonalValue = Int(Double(optionalvalue!) * 1.08)


// オプショナル値の初期値

nonOptonalValue = Int(Double(optionalvalue ?? 0) * 1.08)

optionalvalue = uriage

nonOptonalValue = Int(Double(optionalvalue ?? 0) * 1.08)

print(optionalvalue)

// オプショナル初期値でprice 関数を作ると

func  priceInit(hinmoku: String, size: String) -> Int {
    let hinmokuJisho = (shohin[hinmoku] ?? ["N": 0])
    let kingaku = ( hinmokuJisho[size] ?? 0)
    return kingaku
}

uriage = 0
for (hinmoku, size) in order {
    uriage += priceInit(hinmoku: hinmoku, size: size)
}

print(uriage)

// さらにオプショナルチェイニングを使う

func priceChain(hinmoku: String, size: String) -> Int {
    let hinmokuJisho = shohin[hinmoku]
    let kingaku = (hinmokuJisho?[size] ?? 0)
    return kingaku
}

uriage = 0
for (hinmoku, size) in order {
    uriage += priceChain(hinmoku: hinmoku, size: size)
}

print(uriage)
