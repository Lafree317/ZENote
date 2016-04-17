//
//  Header.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/14.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

/** 屏幕宽度高度 */
let kZEScreenWidth = UIScreen.mainScreen().bounds.size.width
let kZEScreenHight = UIScreen.mainScreen().bounds.size.height
let kNavigationHight:CGFloat = 64

let menu_blog = "博客"
let menu_UI = "界面"
let menu_status = "吐槽"
let imageName_camera = "camera"


let HomeSegueNotification = "HomeSegueNotification"
let NotiOption = "option"
let NotiSender = "sender"

enum ZETableViewOption:Int {
    case Status_new = 1
    case Status_cell = 2
    case Blog_cell = 3
    case UI_cell = 4
    
 
}