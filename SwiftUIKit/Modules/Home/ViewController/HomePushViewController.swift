//
//  HomePushViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

/// 申明闭包
typealias callBack = ()->()

class HomePushViewController: BaseViewController {
    
    var callBackWithParam:((String, String) -> (Void))?
    var callBack:callBack?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func callBackWithParam(_ sender: UIButton) {
        if (callBackWithParam != nil){
            self.callBackWithParam!("Value","Value1")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func callBack(_ sender: UIButton) {
        if (callBack != nil) {
            self.callBack!()
        }
        self.navigationController?.popViewController(animated: true)
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
