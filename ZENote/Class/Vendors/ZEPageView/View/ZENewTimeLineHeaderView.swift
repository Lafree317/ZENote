//
//  ZENewTimeLineHeaderView.swift
//  ZENote
//
//  Created by 胡春源 on 16/4/15.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

protocol ZENewTimeLineHeaderViewDelegate {
    func newTimeButtonClick()
}

class ZENewTimeLineHeaderView: UIView {
    var delegate:ZENewTimeLineHeaderViewDelegate?
    override func awakeFromNib() {
        self.backgroundColor = UIColor.groupTableViewBackgroundColor()
    }
    @IBAction func buttonClick(sender: UIButton) {
        delegate?.newTimeButtonClick()
    }
}
