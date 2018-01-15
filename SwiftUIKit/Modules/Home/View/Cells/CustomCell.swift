//
//  CustomCell.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var headImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.headImgView.layer.masksToBounds = true
        self.headImgView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
