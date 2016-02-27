//
//  ViewController.swift
//  10- 闭包
//
//  Created by jxf on 16/2/7.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 正常写法
//        test { () -> () in
//            print("妈妈, 我被打了")
//        }
        // 2. 如果闭包所在形参列表, 闭包是最后一个, 则闭包可以写在()外面, 我么称之为闭包尾随
//        test(){
//            print("mama")
//        }
        // 3. 如果函数只有一个参数且这个参数是闭包, 则()可以省略
        test{
            print("msms")
        }
    }
    
    func test(myBlock : () -> ()){
        
        myBlock()
    }
}

