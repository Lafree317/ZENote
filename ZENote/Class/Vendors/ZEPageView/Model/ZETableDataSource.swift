//
//  ZETableDataSource.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/15.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

class ZETableDataSource: NSObject,UITableViewDataSource {
    
    var model:ZETableModel!

    
    init(model:ZETableModel) {
        super.init()
        self.model = model
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return model.sectionCount
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.cellCount
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ZECell", forIndexPath: indexPath) as! ZECell
        
        return cell
    }
    

}
