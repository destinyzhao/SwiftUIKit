//
//  CustomCellViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

class CustomCellViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataArray = [ContentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setup()
        self.configData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() -> Void {
        self.title = "自定义cell"
        
        self.tableView .register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    func configData() -> Void {
        for _ in 0..<20{
            let model = ContentModel()
            model.content = "埃及福利卡减肥了咖啡敬老卡减肥啦就罚款拉丝机开了房爱上咖啡就卡了搜附近咖啡机点开链接按时付款就爱看了积分卡的积分按时开放金坷垃就罚款打扫房间"
            model.imgUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1516097136438&di=600ec49b324fe7f16e1eb20b60f3182b&imgtype=0&src=http%3A%2F%2Fqq1234.org%2Fuploads%2Fallimg%2F140818%2F3_140818171934_4.jpg"
            self.dataArray.append(model)
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

extension CustomCellViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.model = dataArray[indexPath.row]
        //cell.setDataForCell(model: dataArray[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
