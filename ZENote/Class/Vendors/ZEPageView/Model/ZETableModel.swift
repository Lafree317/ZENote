//
//  ZETableModel.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/15.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

class ZETableModel: NSObject {
    
    var headerHight:CGFloat!
    var footerHight:CGFloat!
    var cellHight:CGFloat!
    
    var cellCount:Int!
    var sectionCount:Int!
    var identifier:String!
    
    init(identifier:String) {
        super.init()
        self.identifier = identifier
        initSomething()
    }
    func initSomething(){
        headerHight = 0.01
        footerHight = 0.01
        cellHight = 100
        cellCount = 20
        sectionCount = 1
        // 如果等于动态的话,才有区头
        if identifier == menu_status {
            headerHight = 35
        }
    }
}
