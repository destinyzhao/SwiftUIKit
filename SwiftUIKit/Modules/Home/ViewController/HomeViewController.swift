//
//  HomeViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = ["PhshViewController","PresentViewController","自定义Cell","下拉刷新","Kingfisher","Alamofire","CollectionViewDemo","Collection运用","Alert","闭包使用"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self .setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func setup() -> Void {
        self.title = "Home";
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

extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.font = UIFont.init(name: "", size: 14.0)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let pushVC = HomePushViewController()
            pushVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(pushVC, animated: true)
            break
            
        case 1:
            let loginVC = LoginViewController()
            let loginNavi = BaseNavigationController.init(rootViewController: loginVC)
            self.present(loginNavi, animated: true, completion: nil)
            break
            
        case 2:
            let customCellVC = CustomCellViewController()
            customCellVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(customCellVC, animated: true)
            break
            
        case 3:
            let refreshVC = RefreshViewController()
            refreshVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(refreshVC, animated: true)
            break
            
        case 5:
            let alamofireVC = AlamofireViewController()
            alamofireVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(alamofireVC, animated: true)
            break
        
        case 6:
            let collectionVC = CollectionViewController()
            collectionVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(collectionVC, animated: true)
            break
            
        case 7:
            let collectionVC = CollectionViewApplyController()
            collectionVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(collectionVC, animated: true)
            break
            
        case 8:
            let alertVC = CustomAlertViewController()
            alertVC.hidesBottomBarWhenPushed =  true
            self.navigationController?.pushViewController(alertVC, animated: true)
            break
            
        case 9:
            let pushVC = HomePushViewController()
            pushVC.hidesBottomBarWhenPushed = true
            pushVC.callBackWithParam = {(value,value1)->Void in
                print("结果为:\(value),\(value1)")
            }
            pushVC.callBack = {()->Void in
                 print("回调成功")
            }
            self.navigationController?.pushViewController(pushVC, animated: true)
            break
            
        default: break
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
