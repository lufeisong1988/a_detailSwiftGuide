//
//  ViewController.swift
//  12- lazy懒加载
//
//  Created by jxf on 16/2/8.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    }
    
    //        lazy var arr = (Int)()
    // 闭包后面的()必须写, 代表执行, 将结果赋值给 arr, 函数其实也是这样, 可以将闭包看成一个匿名函数
    lazy var arr : [String]? = {
        print("我被加载了")
        return ["xxx", "ddd", "sss"]
    }()
    // 函数是一个特殊的闭包

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print((self.arr)!)
        
        }
    
    
//    block : () -> ()
//    num : Int
}

