//
//  AlamofireViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/16.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

class AlamofireViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    /// 首页列表数据
    var items = [AlamofireModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setup()
        self.requestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() -> Void {
        self.tableView .register(UINib(nibName: "AlamofireCell", bundle: nil), forCellReuseIdentifier: "AlamofireCell")
    }
    
    func requestData() -> Void {
        weak var weakSelf = self
        HomeNetworkService.shareNetworkService.loadHomeInfo(id: 4) { (homeItems) in
            weakSelf!.items = homeItems
            weakSelf!.tableView!.reloadData()
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

extension AlamofireViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireCell", for: indexPath) as! AlamofireCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.homeItem = items[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
