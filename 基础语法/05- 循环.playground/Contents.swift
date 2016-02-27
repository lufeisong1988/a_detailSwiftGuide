//: Playground - noun: a place where people can play

import UIKit

/*:
### for 循环
- 与 OC 用法基本一致, 只是注意判断语句必须是 Swift 的 BOOL 类型, 且大括号不能省略, Swift 的判断语句的()可以省略
*/

for(var i = 0; i < 10; i++)
{
    print(i)
}
for var i = 0; i < 10; i++
{
    print(i)
}

/*:
### 区间
- 半闭区间: 0..<10 包含头, 不包含尾
- 闭区间: 0...10 包含头, 包含尾
*/
// 一般不会像上面那样写, 太 low
for i in 0..<10 // 半闭区间
{
    print(i)
}
for i in 0...10 // 闭区间
{
    print(i)
}

// 如果在循环中不需要用到 i, 可以使用_来代替
for _ in 0..<10 {
    print("helloWorld")
}

/*:
### while 循环
- 与 OC 用法基本一致, 只是注意判断语句必须是 Swift 的 BOOL 类型, 且大括号不能省略, Swift 的判断语句的()可以省略
*/
var i = 10
while i > 0
{
    print(i)
    i--
}

/*:
### OC do while对应 swift 的 repeat while 循环
- 与 OC 用法基本一致, 只是注意判断语句必须是 Swift 的 BOOL 类型, 且大括号不能省略, Swift 的判断语句的()可以省略
*/
var j = 10

repeat
{
    print(j)
    j--
}while j > 0
