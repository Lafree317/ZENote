// 掘金:http://gold.xitu.io/#/user/567bbee434f81a1d8790bd0c
// 简书"http://www.jianshu.com/p/1523c6bd3253
// github:https://github.com/Lafree317

import UIKit


protocol ZETableViewControllerDelegate{
    func tableViewDidScrollPassY(tableviewScrollY:CGFloat)
}

class ZETableViewController: UITableViewController {
    
    var delegate:ZETableViewControllerDelegate?
    var tags:String!
    var datasource:ZETableDataSource?
    var zedelegate:ZETableViewDelegate?
    var model:ZETableModel?
    
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
        
        zedelegate = ZETableViewDelegate(model: model!)
        self.tableView.delegate = zedelegate
        
        
    }
}
