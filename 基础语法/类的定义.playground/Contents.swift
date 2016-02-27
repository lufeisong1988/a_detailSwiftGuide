//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//: 类的定义: class 类名 : 父类 {

//    }
class Student : NSObject {
    // 属性
    // 存储属性, 如果是结构体/对象类型, 通常声明为可选类型
    // 如果是基本数据类型, 通常赋值为一个初始化值
    var name : String? = nil // 类的属性必须初始化
    var age : Int = 0
    var mathScore: Int = 0
    var chineseScore : Int = 0
    // 计算属性
    var averageScore : Double{
        get {
            return (Double(mathScore) + Double(chineseScore)) * 0.5
        }
    }
    // 类属性, 可以用类来直接调用
    static var courseCount = 0
    // 函数
}
let st = Student()
st.age = 18
print(st.age)

st.name = "jinxiaofei"
print(st.name) // 可选类型

// 解包
if let tempName = st.name {
    print(tempName)
}
// 类属性, 可以用类来直接调用
Student.courseCount

