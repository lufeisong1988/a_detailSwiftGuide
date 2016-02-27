//
//  ViewController.swift
//  14- 属性
//
//  Created by jxf on 16/2/8.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let p = Person()
        print(p.age)
        p.adress = "ksjdfksj"
        print(p.adress)
        
    }


}

