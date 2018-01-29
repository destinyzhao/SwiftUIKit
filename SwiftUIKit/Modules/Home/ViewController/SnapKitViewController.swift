//
//  SnapKitViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/29.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitViewController: BaseViewController {
    
    lazy var testView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() -> Void {
        self.view.addSubview(testView)
        testView.backgroundColor = UIColor.red
        testView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
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
