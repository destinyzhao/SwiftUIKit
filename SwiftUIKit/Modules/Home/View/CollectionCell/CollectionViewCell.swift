//
//  CollectionViewCell.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/26.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let url = URL.init(string: ("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1516958754767&di=2e061ac6bf925ae5a7f3963bab6caff2&imgtype=jpg&src=http%3A%2F%2Fimg1.imgtn.bdimg.com%2Fit%2Fu%3D3113153671%2C3782273400%26fm%3D214%26gp%3D0.jpg"))
        imgView.kf.setImage(with: url,placeholder: nil,options: [.transition(ImageTransition.fade(1))],
                                progressBlock: { receivedSize, totalSize in
        },
                                completionHandler: { image, error, cacheType, imageURL in
                                    
        })
    }

}
