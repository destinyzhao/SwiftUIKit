//
//  CustomCell.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {

    @IBOutlet weak var headImgView: UIImageView!
    @IBOutlet weak var textlbl: UILabel!
    
    var model:ContentModel?{
        didSet{
            let url = URL.init(string: (model?.imgUrl)!)
            headImgView.kf.setImage(with: url,placeholder: nil,options: [.transition(ImageTransition.fade(1))],
                                    progressBlock: { receivedSize, totalSize in
                                    },
                                    completionHandler: { image, error, cacheType, imageURL in
                                      
            })
            
            textlbl.text = model?.content
        }
    }
    
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
    
    func setDataForCell(model:ContentModel) -> Void {
        let url = URL.init(string: (model.imgUrl)!)
        headImgView.kf.setImage(with: url,placeholder: nil,options: [.transition(ImageTransition.fade(1))],
                                progressBlock: { receivedSize, totalSize in
        },
                                completionHandler: { image, error, cacheType, imageURL in
                                    
        })
        
        textlbl.text = model.content
    }
    
}
