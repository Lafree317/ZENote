//
//  XTStatusCloud.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/22.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

class XTStatusCloud: NSObject {
    static let shareSingleOne = XTStatusCloud()
    override init() {
        super.init()
        
    }
    func saveNewStatus(statusModel statusModel:XTStatusMdoel,callBack:SaveBlock){
        
        if (statusModel.content == nil) && (statusModel.imageArr == nil) {
            print("该Status为空,不需要保存")
            return;
        }
        
        statusModel.saveInBackgroundWithBlock { (success, error) in
            callBack(success: success, error: error)
        }
    }
}