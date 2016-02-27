//: Playground - noun: a place where people can play

import UIKit

/*:
### 字符串
- OC 中的字符串是一个对象, Swift 中的字符串是一个结构体
- OC 中的字符串以\0结尾, Swift 中的字符串不是以\0结尾的
- Swift 中的字符串比OC 中的字符串性能高
- Swift 的字符串支持直接遍历
*/

let str = "jinxiaofei"
print(str)

for c in str.characters
{
    print(c)
}

//: 拼接字符串
var str1 = str + "dashen"

//: 格式化
let name = "jinxiaofei"
let age = 24
let res = "name = \(name), age = \(age)"

let res1 = String(format: "%d-%02d-%02d", arguments: [2016, 2, 7])

//: 字符串截取
let str2 = "jinxiaofei"
//: 对 Swift进行字符串截取操作, 最好将字符串转为 OC 对象类型, Swift 中大部分数据类型都支持直接转换为 OC数据类型
let res2 = (str2 as NSString).substringFromIndex(3)
let res3 = (str2 as NSString).substringToIndex(3)
let str3 : NSString = str2
