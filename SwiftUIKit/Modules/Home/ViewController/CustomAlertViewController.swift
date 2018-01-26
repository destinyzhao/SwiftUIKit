//
//  CustomAlertViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/26.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

class CustomAlertViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alertBtnClicked(_ sender: UIButton) {
        
        let item1 = PopupItem(title: "确定", type: .destruct,titleColor:UIColor.red) {
            print("点击了‘确定’按钮")
        }
        let item2 = PopupItem(title: "取消", type: .normal,titleColor:UIColor.blue) {
            print("点击了‘取消’按钮")
        }
        let popView = PopupAlertView(title: "标题",titleColor:nil,titleFont:UIFont.systemFont(ofSize: 15), message: "内容信息，此处可填写很多很多很多的内",messageColor:UIColor.orange,messageFont:UIFont.systemFont(ofSize: 14), items: [item1, item2])
        popView.show()
        popView.popType = .alert
    }
    
    @IBAction func actionSheetBtnClicked(_ sender: UIButton) {
        let item1 = PopupItem(title: "第一个按钮", type: .destruct) {
            print("点击了‘第一个按钮’按钮")
        }
        let item2 = PopupItem(title: "第二个按钮", type: .normal) {
            print("点击了‘第二个’按钮")
        }
        let sheetView = PopupSheetView(message: "message", items: [item1, item2])
        sheetView.show()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
