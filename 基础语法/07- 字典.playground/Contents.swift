//: Playground - noun: a place where people can play

import UIKit

/*:
### 字典
- 和 OC 的区别:
    - {} 替换为 []
    - 去掉所有的@
    - 字典 , 与 OC 不一样, swift 字典还是用[ ], 其实如果[ ] 里面放的是元素, 就表示数组, 放的是键值对, 就表示字典
- 可变字典 var
- 不可变字典 let
*/

//: let 不可变
let dict : Dictionary = ["name" : "jinxiaofei", "age": 18]
let dict2 : [String : NSObject] = ["name" : "jinxiaofei", "age": 18]
// 泛型
let dict3 : Dictionary<String, NSObject> = ["name" : "jinxiaofei", "age": 18]

//: var 可变
var dictM = [String : NSObject]()

//: 字典一般操作
// 曾
dictM["name"] = "jinxiaofei"
dictM["age"] = 18
dictM["height"] = 188
dictM
// 删
dictM.removeValueForKey("age")
dictM

//修改
dictM["name"] = "jxf" // 如果所修改的 key 不存在, 则直接添加对应的键值对
// 取
let name____ = dictM["name"]

//: 遍历字典
// 遍历所有 key
for key in dictM.keys {
    print(key)
}
// 遍历 value
for value in dictM.values {
    print(value)
}
// 遍历 key 和 value
for (key, value) in dictM {
    print(key, value)
}

//: 合并字典, 与数组不一样, 相同类型的字典是不能合并的
let dict1_ = ["name" : "jinxiaofei", "age": 18]
var dict2_ = ["name" : "xiaoming", "age": 18]
for (key, value) in dict1_ {
    dict2_[key] = value
}
