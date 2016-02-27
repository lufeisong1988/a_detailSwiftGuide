//
//  ViewController.swift
//  13- 构造函数
//
//  Created by jxf on 16/2/8.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    // Swift同一个项目中不需要导入头文件, 因为Swift 提供了一个命名空间的概念, 一个项目就是一个命名空间, 在同一命名空间下不需要导入头文件
    // 默认情况下, 项目名称就是命名空间
        
    
//    let p = Person()
        let p = Person(name: "jin", age: 20)
        print(p.name)
        let p1 = Person.init(name: "xiaofei", age: 24)
        print(p1.name, p1.age)
//        let p2 = Person.init() // 如果自定义了构造方法, 且没有重写系统的构造方法, 系统默认的构造方法会失效
        
        
        let dict = ["name" : "jinxiaofei", "age" : 24]
        let p2 = Person.init(dict: dict)
        print(p2.name, p2.age)
//        let str = p2.name! + "swjtu"
        
        print(p2)
    }
    
    let p5 = Person()


}

