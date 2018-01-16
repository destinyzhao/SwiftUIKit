//
//  RefreshViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/16.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit
import ESPullToRefresh

class RefreshViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var page = 0
    var dataCount = 20
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setup()
        self.setupRefresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setup() -> Void {
        self.title = "TableView刷新"
        
        self.tableView .register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    func setupRefresh() -> Void {
        var header: ESRefreshProtocol & ESRefreshAnimatorProtocol
        var footer: ESRefreshProtocol & ESRefreshAnimatorProtocol
        
        header = ESRefreshHeaderAnimator.init(frame: CGRect.zero)
        footer = ESRefreshFooterAnimator.init(frame: CGRect.zero)
        
        self.tableView.es.addPullToRefresh(animator: header) { [weak self] in
            self?.refresh()
        }
        self.tableView.es.addInfiniteScrolling(animator: footer) { [weak self] in
            self?.loadMore()
        }
    }
    
    func refresh() ->Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.page = 1
            self.dataCount = 20
            self.tableView.reloadData()
            self.tableView.es.stopPullToRefresh()
        }
    }
    
    func loadMore() ->Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.page += 1
            self.dataCount += 20;
            self.tableView.reloadData()
            self.tableView.es.stopLoadingMore()
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

extension RefreshViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
