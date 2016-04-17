// 掘金:http://gold.xitu.io/#/user/567bbee434f81a1d8790bd0c
// 简书"http://www.jianshu.com/p/1523c6bd3253
// github:https://github.com/Lafree317

import UIKit


protocol ZETableViewControllerDelegate{
    func tableViewDidScrollPassY(tableviewScrollY:CGFloat)
}

class ZETableViewController: UITableViewController,ZENewTimeLineHeaderViewDelegate {
    
    var delegate:ZETableViewControllerDelegate?
    var tags:String!
    var datasource:ZETableDataSource?
    
    var model:ZETableModel!
    let notification = NSNotificationCenter.defaultCenter()
    // 懒加载新建status的区头
    var timeLineHeader:ZENewTimeLineHeaderView{
        get{
            let header = NSBundle.mainBundle().loadNibNamed("ZENewTimeLineHeaderView", owner: self, options: nil).first as! ZENewTimeLineHeaderView
            header.delegate = self
            return header
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI(){
        // 注册cell
        self.tableView.registerNib(UINib.init(nibName: "ZECell", bundle: nil), forCellReuseIdentifier: "ZECell")
        // viewModel
        model = ZETableModel(identifier: tags)
        
        datasource = ZETableDataSource(model: model!)
        self.tableView.dataSource = datasource
        
        
        self.tableView.delegate = self
        
                
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return model.headerHight
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return model.footerHight
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if model.identifier == menu_status {
            return timeLineHeader
        }else{
            return nil
        }
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return model.cellHight
    }
    // 新添加Status的代理事件
    func newTimeButtonClick() {
        
        self.postNotification(option:.Status_new, sender: "abbbbb")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var option:ZETableViewOption!
        if model.identifier == menu_blog {
            option = .Blog_cell
        }else if model.identifier == menu_UI{
            option = .UI_cell
        }else if model.identifier == menu_status{
            option = .Status_cell
        }
        self .postNotification(option: option, sender: "bccccc")
    }
    func postNotification(option option:ZETableViewOption,sender:AnyObject){
        let noti = NSNotification(name: HomeSegueNotification, object: nil, userInfo:[NotiOption:option.rawValue,NotiSender:sender])
        notification.postNotification(noti)
    }
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        delegate?.tableViewDidScrollPassY(scrollView.contentOffset.y)
    }

}
