//
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/16.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

enum ItemType {
    case normal
    case destruct
}

class PopupItem {
    
    /// 标题
    var title: String!
    /// 类型
    var type: ItemType!
    /// 颜色
    var titleColor: UIColor?
    
    var click: (() -> ())?
    
    init(title: String, type: ItemType, click: (() -> ())?) {
        self.title = title
        self.type = type
    }
    
    init(title: String, type: ItemType,titleColor:UIColor, click: (() -> ())?) {
        self.title = title
        self.type = type
        self.click = click
        self.titleColor = titleColor
    }
}

