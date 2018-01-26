//
//  CollectionApplyCell.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/26.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

protocol CollectionApplyCellDelegate:NSObjectProtocol {
    func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class CollectionApplyCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    weak var delegate: CollectionApplyCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var product:ProductModel?{
        didSet{
            let url = self.product!.cover_image_url!
            productImageView.kf.setImage(with: URL(string: url)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                
            }
            likeButton.setTitle(" " + String(self.product!.favorites_count!) + " ", for: .normal)
            titlelbl.text = self.product!.name
            pricelbl.text = "￥" + String(self.product!.price!)
        }
    }
    
   
    @IBAction func likeButtonClick(_ sender: UIButton) {
        delegate?.collectionViewCellDidClickedLikeButton(button: sender)
    }
    
    
    
}
