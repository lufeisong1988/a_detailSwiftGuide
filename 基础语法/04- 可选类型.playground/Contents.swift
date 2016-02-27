//: Playground - noun: a place where people can play

import UIKit

/*:
### 可选类型
- 在 OC 中我们可以给一个对象类型的变量赋值为 nil或者一个对象, 而在 Swift 中如果想给一个变量赋值为 nil, 那么必须明确指定该变量为可选类型才可以, 也就是说普通变量是不能赋值为 nil的
- 格式: 数据类型?
- 但凡看到 init 后面跟上一个?, 就代表着初始化方法返回的是可选类型的值
- 注意: 
    - 可选类型是不能直接使用的, 如果要想使用一个可选类型的值, 那么必须解包
    - 格式: 可选类型的变量 !
    - 解包的含义: 告诉系统可选类型的变量, 一定有值, 如果可选类型没有值, 我们又进行了强制解包, 就会报错
- 说明: 其实解包就是为了解决 OC 中可以给随意对象赋值为 nil而造成的一些报错, 比如一个对象属性, 你没有进行初始化, 编译是不会报错的, 一旦运行的时候, 就会发现,程序不能正常运行或没有数据, 原因就是你的属性是 nil, 你的对它进行初始化
*/

// 完整写法
var test : Optional<String> = nil // 确定变量的被赋值的类型, 型当于泛型
// 常用 (语法糖)
var test1 : String? = nil

print(test1)
test1 = "test"
print(test1) // 注意打印结果任然是可选类型--> Optional("test"), 如果我们想使用这个可选类型的话, 是不能够直接赋值的, 需要在可选类型后面加一个!号, 表示从可选类型中取值
// 通过!取值的过程称之为强制解包
// 强制解包是一个非常危险的动作, 一般强制解包都会做一个判断
let tempName1 = test1!
// 如果可选类型中并没有值的话, 程序会崩溃
// var tempName = test!

if test != nil {
    print(test)
}


// 应用, 比如创建 url 返回的就是一个可选类型
let str = "http://www.520it.com"
let url = NSURL(string: str) // let url: NSURL?, 此时的 url就是可选类型
print(url) // 注意答应的结果是 optional 的
print(url!) // 强制解包后的结果就是确定的了

// 强制解包为空的情况
let str1 = "http://www.520it.com.png.小码哥"
let url1 = NSURL(string: str1)
print(url1)
//print(url1!) // 当强制解包后的结果是, nil就会报错


/*:
### 可选绑定
- 专门用于强制解包的弊端
- 注意, 开发中如果想使用一个可选类型的值, 也不一定一定用可选绑定, 因为如果可选类型的值较多, 而又都属于同一个逻辑, 那么一不小心就会形成if嵌套
*/

// 取出url1的值赋值给tUrl, 如果取到了值那么就可以进入if后面的大括号, 如果没有取到值(nil), 就不会进入if后面的大括号
if let tUrl = url1
{
    print(tUrl) // 不会进入到大括号
}

let a : Int? = 10
let b : Int? = 11
let c : Int? = 12
//let sum = a + b + c // 错误
if let n1 = a
{
    if let n2 = b
    {
        if let n3 = c
        {
            let sum = n1 + n2 + n3
        }
    }
}


/*:
### guard
- 作用: 类似可选绑定
- 只有条件为 false, 才会执行 else 后面大括号里的代码
- 格式: 
    guard 天健表达式 else
{
    // 条件为假就会执行
}
*/

func test()
{
    guard let m1 = a else
    {
        print("ni")
        return
    }
    guard let m2 = b else
    {
        print("ni")
        return
    }
    guard let m3 = c else
    {
        print("ni")
        return
    }
    
    let sum = m1 + m2 + m3
}

test()


