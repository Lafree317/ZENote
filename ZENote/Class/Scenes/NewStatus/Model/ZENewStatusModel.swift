//
//  ZENewStatusModel.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/27.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit
import Photos
class ZENewStatusModel: NSObject {
    
    /**
     保存图片的model封装
     
     - parameter text:    textView.text
     - parameter modelAr: PhotoImageModel数组
     */
    func setStatus(text:String,modelAr:[PhotoImageModel]){
        // 存储图片data的数组
        var imageArr:Array<UIImage?> = []
        
        for i in 0..<modelAr.count {
            let model = modelAr[i]
            let options = PHImageRequestOptions()
            options.networkAccessAllowed = true
            // 取出图片的方法
            PhotoImageManager.sharedManager.requestImageDataForAsset(model.data!, options: options, resultHandler: { (data, dataUTI, oritation, info) -> Void in
                if let data = data {
                    let resultImage = UIImage(data: data, scale: 0.1)
                    imageArr.append(resultImage)
                }
            })
        }
        

    }

}
