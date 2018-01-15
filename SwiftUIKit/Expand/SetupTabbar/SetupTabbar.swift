//
//  SetupTabbar.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import Foundation
import ESTabBarController_swift

public class SetupTabbar{
    static func customStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let homeVC = HomeViewController()
        let findVC = FindViewController()
        let favorVC = FavorViewController()
        let messageVC = MessageViewController()
        let meVC = MeViewController()
        
        let homeNavi = BaseNavigationController.init(rootViewController: homeVC)
        let findNavi = BaseNavigationController.init(rootViewController: findVC)
        let favorNavi = BaseNavigationController.init(rootViewController: favorVC)
        let messageNavi = BaseNavigationController.init(rootViewController: messageVC)
        let meNavi = BaseNavigationController.init(rootViewController: meVC)
        
        homeNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(), title: "Home", image: UIImage(named: "tabbar_home_n"), selectedImage: UIImage(named: "tabbar_home_s"))
        findNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(),title: "Find", image: UIImage(named: "tabbar_find_n"), selectedImage: UIImage(named: "tabbar_find_s"))
        favorNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(),title: "Favor", image: UIImage(named: "tabbar_favor_n"), selectedImage: UIImage(named: "tabbar_favor_s"))
        messageNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(),title: "Message", image: UIImage(named: "tabbar_message_n"), selectedImage: UIImage(named: "tabbar_message_s"))
        meNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(),title: "Me", image: UIImage(named: "tabbar_me_n"), selectedImage: UIImage(named: "tabbar_me_s"))
        
        tabBarController.viewControllers = [homeNavi, findNavi, favorNavi, messageNavi, meNavi]
        
        return tabBarController
    }
}
