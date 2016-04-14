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
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print(tags+"WillAppear")
       
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.registerNib(UINib.init(nibName: "ZECell", bundle: nil), forCellReuseIdentifier: "ZECell")
    }
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        self.delegate?.tableViewDidScrollPassY(scrollView.contentOffset.y)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ZECell", forIndexPath: indexPath) as! ZECell

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}
