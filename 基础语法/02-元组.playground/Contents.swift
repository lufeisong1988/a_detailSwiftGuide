//: Playground - noun: a place where people can play

import UIKit

/*:
###元组
- 元组是Swift新增的一种基本数据类型
- 格式: (数据1, 数据2, 数据3), 元组内可以放不同的数据类型
- 通过索引访问
- 可以给元组的元素命名, 类似于字典的key, 通过元组名称访问


*/

let scores = (99, 89, 78.5)

// 通过索引访问

let score1 = scores.0
let score2 = scores.1
let score3 = scores.2

// 可以给元组的元素命名, 类似于字典的key, 通过元组名称访问
let person = (name : "jxf", age : 24, score : 99)

let personName = person.name
let personAge = person.age
let personScore = person.score

// 也可以这样写, 相当于同时定义了三个变量

var (name, age, score) = person
name
age
score

name = "jinxiaofei"
