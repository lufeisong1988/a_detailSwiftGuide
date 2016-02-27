//
//  TestViewController.swift
//  11- 闭包的循环引用
//
//  Created by jxf on 16/2/8.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    // 注意: Swift 规定一个对象中的属性必须在对象初始化时全部初始化
    // 如果没有在初始化时给所有的属性赋值, 就会报错
    // 解决: 将属性变成可选的
    
    // 注意: 错误写法()->()? , 这中写法代表闭包的返回值是可选的, 而不是闭包是可选的
    // 可选类型的值, 如果没有初始化, 那么默认值就是nil
    var block : (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        // 闭包避免循环引用的办法:
        // 1.用 weak 弱化指着
//        weak var weakSelef  = self
//        test{
//            print("xxx")
//            weakSelef!.view.backgroundColor = UIColor.redColor()
//        }
        
        //        Swift中的weak对应OC中的__weak, 如果对象释放了, 那么会自动将变量赋值为nil
        //        Swift中的unowned对应OC中的__unsafe_unretained,  如果对象释放了, 不会将变量赋值为nil, 如果对象释放了再继续访问会出现野指针错误
        
        // 2. [unowned self]
        
                test{[unowned self] () -> () in
        
                    print("xxx")
                    self.view.backgroundColor = UIColor.redColor()
                    
                }

        
    }
    
    func test(myBlock : () -> ()){
        
        self.block = myBlock
        myBlock()
        
    }
    
    deinit{
        
        print("gun")
        
    }

}
