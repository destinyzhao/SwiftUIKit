//
//  HomeNetworkService.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/16.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeNetworkService: NSObject {
    
    /// 单例
    static let shareNetworkService = HomeNetworkService()
    
    /// 获取首页数据
    func loadHomeInfo(id: Int, finished:@escaping (_ homeItems: [AlamofireModel]) -> ()) {
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    //SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    //let message = dict["message"].stringValue
                    guard code == Network_success else {
                        //SVProgressHUD.showInfo(withStatus: message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject {
                        var homeItems = [AlamofireModel]()
                        for item in items {
                            let homeItem = AlamofireModel(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                        }
                        finished(homeItems)
                    }
                }
        }
    }

}
