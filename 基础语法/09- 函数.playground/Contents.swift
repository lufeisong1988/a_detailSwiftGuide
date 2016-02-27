//: Playground - noun: a place where people can play

import UIKit

/*:
## 函数
- 格式:
    - func 函数名称(形参名称1 : 形参1类型, ...) -> 返回值类型
    {
        逻辑代码
    }
- 类型: 
    - 没有参数没有返回值
    - 没有参数有返回值
    - 有参数没有返回值
    - 有参数有返回值
*/

/*:
### 无反无参
*/
// 如果函数的返回值是 Void, 那么可以简写为(), 如果函数的返回值是(), 那么可以直接不写
func test() -> Void
{
    print("heheda")
}

func test1() -> ()
{
    print("heheda")
}
func test2()
{
    print("heheda")
}
test2()

/*:
### 无参有反
*/
func test3() -> Int
{
    return 10
}
test3()
    // 返回元组
func test4() -> (Int, Int)
{
    return(100, 99)
}
let (max, min) = test4()
print(max)
print(min)

/*:
### 有参数, 没有返回值
*/
// Swift2.0之后, 默认将第二个参数名作为标签名称, 在 swift2.0之前, 如果想要实现这个功能, 要手动添加外部参数
func test5(num1 : Int, num2 : Int)
{
    print(num1 + num2)
}
test5(10, num2: 20)


/*:
#### 外部参数和内部参数
* 内部参数: 默认情况下, 所有的形参都是内部参数
* 外部参数: Swift2.0之前, 可以通过在形参前面加上名称的方式来制定外部参数, Swift2.0之后, 默认情况下从第二个形参开始, 形参既是内部参数又是外部参数

如何指定外部参数:
*  在形参前面以空格隔开, 加上一个名称即可
*  例如: value2 num2: Int
外部   内部  数据

如何忽略外部参数:
* 在形参前面以空格隔开, 加上_
* _代表忽略
* 例如:  _   num2: Int
忽略 内部  数据
*/
func test6(value1 num1 : Int, value2 num2 : Int)
{
    print(num1 + num2)
}
test6(value1: 10, value2: 20)

func test7(num1 : Int, _ num2 : Int)
{
    print(num1 + num2)
}
test7(10, 20)
/*:
#### 常量形参和变量形参
* 默认情况下所有的形参都是常量形参, 也就是说不能在函数中修改形参的值
* 如果想在函数中修改形参的值, 那么必须把形参变为变量形参
*    只需要在变量名称前面加上 var即可
*    注意: 在函数中修改形参的值, 是不会影响到外部实参的值
*/

func test8(var num1 : Int, var num2 : Int)
{
    let temp = num1
    num1 = num2
    num2 = temp
    print(num1, num2)
}

test8(10, num2: 20)

/*:
#### 输入输出参数
* 如果想在函数中修改形参的值, 并且同时修改实参的值, 那么就必须将形参变为输入输出形参
*   只需要在形参名称前面加上inout即可
*/
func test9(inout num1 : Int, inout num2 : Int)
{
    let temp = num1
    num1 = num2
    num2 = temp
}
var m = 10
var n = 11
print(m, n)
test9(&m, num2: &n)
print(m, n)

/*:
#### 可变参数
* 当一个函数不确定接收多少个参数时, 就可以使用可变参数
* 举例: 计算两个数的和 --> 需求变更 --> 计算三个数的和 --> 需求又变更 --> 计算10个数的和
注意点:
* 可变参数必须指定数据类型
* 在其它语言中有可能可变参数只能放到形参列表的最后面, 而Swift中可以放到任意位置
*/

func test10(num : Int, nums : Int...)
{
    print(num)
    print(nums)
}
//test10(10)
test10(10, nums: 10, 11, 12)

func test11(num : Int, nums : Int..., name : String)
{
    print(nums)
}
test11(10, nums: 23, 25, name: "jj")
/*:
#### 默认值
* 可以给形参指定默认值, 如果一个形参指定了默认值, 那么调用的时候就可以不传递该参数的值, 如果没有传递那么就使用默认值
注意点
* 在其他语言中可能默认值只能写在形参列表的最后面, 但是Swift中可以写在任意位置
*/
func test12(num1 : Int = 12, num2 : Int = 20)
{
    print(num1 + num2)
}
//test12()
//test12(1, num2: 1)
test12(10)

/*:
#### 有参数有返回值
*/
func sum5(num1: Int, num2: Int) -> Int
{
    return num1 + num2
}
print(sum5(20, num2: 20))
