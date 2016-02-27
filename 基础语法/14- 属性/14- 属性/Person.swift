//
//  Person.swift
//  14- 属性
//
//  Created by jxf on 16/2/8.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    
    var _adress : String?
    var adress : String?{
        set{
            
            _adress = newValue

        }
        get{
            return _adress
        }
    }
    // 开发中一般不会像上面那么写
    var name : String?{
        
        
        willSet{
            print(name)
            print(newValue)
        }
        // 只要给属性赋值, 就会调用 didSet, 能够监听属性的值, 一般使用这个方法, 上面的方法也会调用, 相当于 OC 中的重写 set 方法
        didSet{
            print(name)
            print(oldValue)
        }
    }
    
    // 如果只重写了 get 方法, 表示该属性为只读属性(Swift称之为计算型属性)
    var age : Int{
        get{
            return 24
        }
    }
    
//    也可以简写
//    var age : Int{
//        return self.age
//    }
    

}


