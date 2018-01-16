//
//  AlamofireModel.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/16.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

class AlamofireModel: NSObject {
    
    var cover_image_url: String?
    var title: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        cover_image_url = dict["cover_image_url"] as? String
        title = dict["title"] as? String
    }

}
