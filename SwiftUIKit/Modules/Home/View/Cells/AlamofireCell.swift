//
//  AlamofireCell.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/16.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

class AlamofireCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    
    var homeItem: AlamofireModel? {
        didSet {
            let url = homeItem!.cover_image_url
            bgImageView.kf.setImage(with: URL(string: url!)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
               
            }
            titlelbl.text = homeItem!.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
