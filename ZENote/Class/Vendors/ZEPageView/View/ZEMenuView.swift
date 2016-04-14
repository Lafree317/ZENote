// 掘金:http://gold.xitu.io/#/user/567bbee434f81a1d8790bd0c
// 简书"http://www.jianshu.com/p/1523c6bd3253
// github:https://github.com/Lafree317

import UIKit

let kZEButtonWidth:CGFloat = 75

protocol ZEMenuViewDelegate {
    func menuViewSelectIndex(index:Int)
}

class ZEMenuView: UIView {
    var lineView:UIView?
    var titleArr:Array<String> = []
    var buttonArr:Array<UIButton> = []
    var margin:CGFloat!
    var delegate:ZEMenuViewDelegate?
    func setUIWithArr(titleArr:Array<String>){
        self.backgroundColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1)
        self.titleArr = titleArr
        margin = (kZEScreenWidth - (CGFloat(titleArr.count) * kZEButtonWidth)) / CGFloat(titleArr.count+1)
        for i in 0 ..< titleArr.count  {
            let floatI = CGFloat(i)
            
            let button = UIButton(type: UIButtonType.Custom)
            let buttonX = margin*(floatI+1)+floatI*kZEButtonWidth
            
            button.frame = CGRectMake(buttonX, 0, kZEButtonWidth,kZEMenuHight)
            
            let title = titleArr[i]
            button.setTitle(title, forState: .Normal)
            button.setTitleColor(COLOR_BUTTON_DEFAULT, forState: .Normal)
            
            button.addTarget(self, action: #selector(buttonClick(_:)), forControlEvents: .TouchUpInside)
            buttonArr.append(button)
            self.addSubview(button)
        }
        buttonSelectIndex(0)
        
        
        // 分割线..没啥用
        let line = UIView(frame: CGRectMake(0,self.frame.height-1,kZEScreenWidth,1))
        line.backgroundColor = UIColor.groupTableViewBackgroundColor()
        self.addSubview(line)
        
        
        lineView = UIView(frame: CGRectMake(margin,self.frame.size.height-2,kZEButtonWidth,2))
        lineView?.backgroundColor = COLOR_BUTTON_SELECT
        self.addSubview(lineView!)
        
        
       
    }
    func buttonClick(button:UIButton){
        let index = buttonArr.indexOf(button)
        buttonSelectIndex(index!)
        delegate?.menuViewSelectIndex(index!)
        UIView.animateWithDuration(0.3) { 
            self.scrollToRate(CGFloat(index!))
        }
    }
    func scrollToRate(rate:CGFloat){
        if Int(rate) >= titleArr.count {
            return
        }
        let index = Int(rate)
        let pageRate = rate - CGFloat(index)
        let button = self.buttonArr[index]
        self.lineView?.frame.origin.x = button.frame.origin.x + ( button.frame.width+margin )*pageRate
        buttonSelectIndex(Int(rate + 0.5))
    }
    func buttonSelectIndex(index:Int){
        for button in buttonArr {
            button.setTitleColor(COLOR_BUTTON_DEFAULT, forState: .Normal)
        }
        let button = buttonArr[index]
        button.setTitleColor(COLOR_BUTTON_SELECT, forState: .Normal)
    }
}
