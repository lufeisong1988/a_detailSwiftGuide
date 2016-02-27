//: Playground - noun: a place where people can play

import UIKit

/*:
###基本语法须知:
- 每一行只有一句完整代码的话, 分好可以省略
- 数据类型与OC的区别: 头字母大写
- Swift是一门强语言, 是类型安全的, 不能隐式转换
- 注意Swift的赋值=的前后一定要有空格, 否则会报错, 应该是bug
*/

/*:
###格式
- 常量:let
- 变量:var
- 完整格式:(let/var) 常量变量名称:数据类型
    - 类型推导: 不用指定类型, swift会自动根据赋值的类型匹配类型
- 常量let一旦初始化就不能修改值
- 优先使用let, 能用常量就尽量用常量, 苹果推荐我们用let, 这就需要我们实时考虑我们的变量是否真的需要

###数据类型
- Swift是类型安全语言, 在任何情况下都不会进行自动类型转换(隐式转换), 这就意味着Int和Double等类型之间不能随意赋值, 也就是说必须严格相同类型之间才能进行赋值
- Swift如果需要进行不同类型之间的值赋值, 必须显式转化:a = Int(b)(注意跟OC显式转换的区别)
    - 例如: Swift: a = Int(b), OC : a = (int)b
*/

let number : Int = 10
// 类型推导
let number1 = 10;
//number = 11;

var age :Int = 24
// 类型推导
var age1 : Int = 24
age = 25

// Swift数据类型
var a : Int = 10;
var b : Double = 1.23
a = Int(b)
