//
//  ZEViewController.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/11.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

class ZEHomeViewController: UIViewController {
    let zePageVC = ZEPageViewController()
    let notification = NSNotificationCenter.defaultCenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutZEPageView()
        
        
        
        
        
    }
    
    func layoutZEPageView(){
        zePageVC.titlesArr = [menu_blog,menu_UI,menu_status]
        self.addChildViewController(zePageVC)
        hiddenNav(true)
        // 回调ZTPage的透明度
        zePageVC.alphaBlock =  {(alpha) in
            if alpha > 0.5 {
                self.hiddenNav(false)
            }else{
                self.hiddenNav(true)
                
            }
        }
        self.view.addSubview(zePageVC.view)
        // 接受ZEPage的segue通知
        notification.addObserver(self, selector: #selector(segueNotification(_:)), name: HomeSegueNotification, object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 对状态栏的操作
    func hiddenNav(hidden:Bool){
        if hidden {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        }else{
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
            UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        }
    }
    
    // 接受ZEPage的segue通知
    func segueNotification(noti:NSNotification){
        // 取出通知内的字典
        let dic = noti.valueForKey("userInfo")!
        // 类型
        let option = ZETableViewOption(rawValue:(dic.valueForKey(NotiOption) as! String))!
        // 传值
        let sender = dic.valueForKey(NotiSender)!
        print(option)
        switch option {
        case .Status_new:
            self.performSegueWithIdentifier(option.rawValue, sender: sender)
            break
        case .Status_cell:
            
            break
        case .UI_cell:
            
            break
        case .Blog_cell:
            
            break
        }
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.hiddenNav(false)
        
        self.navigationController?.navigationBar.alpha = 1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
