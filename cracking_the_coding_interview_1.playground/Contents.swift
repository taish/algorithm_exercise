//: Playground - noun: a place where people can play

import UIKit

// 1.1

//let string = "jksafe"
//let stringArray = Array(string.characters)
//let sortedStringArray = stringArray.sorted { $0 < $1 }
//let sortedString = String(sortedStringArray)
//var unique = true
//for num in 0...sortedStringArray.count - 2 {
//    if sortedStringArray[num] == sortedStringArray[num + 1] {
//        unique = false
//        break
//    }
//}

// 1.2
// 質問:
var str = "Hello"
var cStr = str.cString(using: String.Encoding.ascii)!

func reverse(_ p: UnsafeMutablePointer<CChar>) {
    var add = 0
    while (p + add).pointee.hashValue != 0 {
        add = add + 1
    }
    print(add)
    var endAdr = p + add - 1
    var strAdr = p
    while (strAdr < endAdr) {
        let tmp = strAdr
        strAdr = endAdr
        endAdr = tmp
    }
}


// 1.3
// 質問: ソートアルゴリズムを使うが、どういうような並びか
func isNarabikae(str1: String, str2: String) -> Bool {
    let sortedStr1Array = Array(str1.characters).sorted { $0 < $1 }
    let sortedStr2Array = Array(str2.characters).sorted { $0 < $1 }
    guard sortedStr1Array.count == sortedStr2Array.count else {
        return false
    }
    var isNarabikae = true
    for i in 0...sortedStr1Array.count-1 {
        if sortedStr1Array[i] != sortedStr2Array[i] {
            isNarabikae = false
            break
        }
    }
    return isNarabikae
}

//isNarabikae(str1: "strtt", str2: "srtttt")

// 1.4
// 質問: 

func sliceEmpty(str: String, strCount: Int) -> String {
    // strを配列に変更
    let strArray = Array(str.characters).map { String($0) == " " ? "%20" : String($0) }


    // 配列の空白を%20に変更
    // 文字列に直す
    return strArray.reduce("", { $0 + $1 })
}
//"hello%20%20world" == sliceEmpty(str: "hello  world", strCount: 10)
//sliceEmpty(str: "hello  world", strCount: 10)

// 1.5
// 質問: 
// 圧縮変換されたあとが短くならない場合は、連続する文字の平均が2以下
func encordHaf(str: String) -> String {
    var str = str
    var array = Array<(Character, Int)>()
    while !Array(str.characters).isEmpty {
        let char = str.characters.removeFirst()
        if array.last?.0 == char {
            array[array.count - 1] = (char, array.last!.1 + 1)
//            array.las = (char, array.last?.1 + 1)
        } else {
            array.append((char, 1))
        }
        print(array)
    }
    let result = array.reduce("") { string, taple in
        string + String(taple.0) + String(taple.1)
    }
    return result
}

//    var ss = array.reduce { $0.0 + $0.1 }



encordHaf(str: "aaabbbcc") == "a3b3c2"
encordHaf(str: "aaabbbcc")




