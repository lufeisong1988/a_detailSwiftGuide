//: Playground - noun: a place where people can play

import UIKit

/*:
### 数组
- 格式: var 名称 : [类型] = [元素1, 元素2, 元素3]
- 可变数组: var, 不可变: let
- 创建一个空数组: var tempArray = [Int]()
- 数组分配空间的规则
    - 始终开辟2的 n 次方的空间
- 数组遍历: for in
*/

let studends = ["xiaoming", "xiaodong", "xiaohua"]
// 指定类型的常用写法
var scores :[Int] = [90, 80, 99]
let array3 : [NSObject] = ["18", 18, "XXX"]
// AnyObject 一般用于指定数组或字典集合的泛型类型, 相当于 NSObject, 指代任意对象
let array4 : [AnyObject] = [12, "ddd"]

// 简写, 类型推导
var scores1 = [90, 80, 99]
// 定义泛型
var scores2 : Array<Int> = [90, 80, 99]
let arrayy : Array<AnyObject> = ["xmg", "xiamage", "limingjie", 18, 23.3]

//: var 定义可变数组, 类型的用法和 let 是一样的,

//: var 定义的可变数组可以先定义再初始化, 但必须指定类型
var names : [String] = Array()
var names1  = Array<String>()
//: 常见写法
var names2 = [String]()

//: 数组的基本操作
// 曾
scores.append(98)
scores.insert(78, atIndex: 0)
// 删
scores.removeAtIndex(0)
scores
// 改
scores[0] = 93
scores
// 查
scores[2]

//: 数组遍历
// 区间遍历
names = ["jjjj"]
for i in 0..<names.count {
    print(names[i])
}
// for in 遍历
for item in names {
    print(item)
}
// 指定区间遍历
for i in 0..<1 {
    print(names[i])
}
// 或者
for item in names[0..<1] {
    print(item)
}


//: 数组的合并
let namesNew = ["yyyy"]
// 如果两个数组的类型是一致的, 可以相加合并
var names_  = names + namesNew
names_.append("jjjj")
names_.insert("tttt", atIndex: 1)

//: 数组分配空间的规则
// 始终开辟2的 n 次方的空间
scores.capacity
scores.append(77)
scores.capacity
