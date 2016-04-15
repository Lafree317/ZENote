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
        
        
        
        // 接收child所有C的segue通知
        notification.addObserverForName(HomeSegueNotification, object: nil, queue: nil) { (noti) in
            let dic = noti.valueForKey("userInfo")
            print(dic)

        }

    }
    func layoutZEPageView(){
        zePageVC.titlesArr = [menu_blog,menu_UI,menu_status]
        self.addChildViewController(zePageVC)
        hiddenNav(true)
        zePageVC.alphaBlock =  {(alpha) in
            if alpha > 0.5 {
                self.hiddenNav(false)
            }else{
                self.hiddenNav(true)
                
            }
        }
        self.view.addSubview(zePageVC.view)
        
        
    }
    
    func layoutNavigation(){
        // 这回回头改成设置按钮
        // 创建新动态放到吐槽的区头里
        let button = UIButton(type: .System)
        button.frame = CGRectMake(0, 0, 44, 44)
        button.setBackgroundImage(UIImage(named: imageName_camera), forState: .Normal)
        button.addTarget(self, action: #selector(cameraAction), forControlEvents: .TouchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    func cameraAction(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hiddenNav(hidden:Bool){
        if hidden {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        }else{
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
            UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        }
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
