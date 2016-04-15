//
//  ZETableViewDelegate.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/15.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit


class ZETableViewDelegate: NSObject,UITableViewDelegate,ZENewTimeLineHeaderViewDelegate {
    
    var timeLineHeader:ZENewTimeLineHeaderView{
        get{
            let header = NSBundle.mainBundle().loadNibNamed("ZENewTimeLineHeaderView", owner: self, options: nil).first as! ZENewTimeLineHeaderView
            header.delegate = self
            return header
        }
    }
    // 这种控制器嵌套台深了,用代理或者block回调太麻烦,于是就用通知到root上segue吧
    let notification = NSNotificationCenter.defaultCenter()
    var model:ZETableModel!

    init(model:ZETableModel) {
        super.init()
        self.model = model
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return model.headerHight
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return model.footerHight
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if model.identifier == menu_status {
            return timeLineHeader
        }else{
            return nil
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return model.cellHight
    }
    //MARK:DELEGATE
    func newTimeButtonClick() {
        notification.postNotification(NSNotification(name: ZETableViewOption.Status_new.rawValue, object: nil))
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var option:ZETableViewOption!
        if model.identifier == menu_blog {
            option = .Status_cell
        }else if model.identifier == menu_UI{
            option = .UI_cell
        }else if model.identifier == menu_status{
            option = .Status_cell
        }
        let noti = NSNotification(name: HomeSegueNotification, object: nil, userInfo:[NotiOption:option.rawValue,NotiSender:"bccccc"])
        notification.postNotification(noti)
    }
}
