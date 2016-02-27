//
//  Person.swift
//  13- 构造函数
//
//  Created by jxf on 16/2/8.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name : String?
    
    // 注意点: 如果自定义一个对象, 而对象的属性如果又是基本数据类型, 那么不建议设置为可选类型
    // 总结规律: 对象类型设置为可选类型, 基本数据类型赋值初始值
    var age  = -1
    
    // 如果既没有重写也没有自定义, 那么系统会给我们提供一个默认的构造方法
    // 如果自定了构造方法, 并且没有重写默认构造方法, 那么系统默认的构造方法就会失效
    
    // 重写父类构造方法
    // 以后但凡看到override, 就代表是重写父类的
    override init() {
        name = "jinxiaofei"
        age = 24
        // 注意, 系统默认会帮我们调用 super.init()
    }
    
    // 自定义构造方法
    init(name : String, age: Int)
    {
        self.name = name 
        self.age = age
    }
    
    // swift 现在还没有比较好用的框架, 现在主要是利用 KVC 来转模型
    
    init(dict : [String : AnyObject]) {
        
        // 注意利用 KVC 转模型一定要调用 super.init()
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        // KVC 转模型, 如果字典和模型属性不能一一对应就会调用这个方法
    }
    // description, 重写这个属性相当于 OC 重写 description 方法
    override var description : String{
        
        let property = ["name", "age"]
        let dict = dictionaryWithValuesForKeys(property)
        return"\(dict)"
        
//        return "name = \(self.name), age = \(self.age)"
    }

}
