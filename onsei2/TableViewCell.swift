//
//  ListTableViewCell.swift
//  onsei2
//
//  Created by 原 あゆみ on 2017/02/20.
//  Copyright © 2017年 原 あゆみ. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet var listLabel: UILabel!
    @IBOutlet var flaglabel: UILabel!
    
    var flaglist = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
