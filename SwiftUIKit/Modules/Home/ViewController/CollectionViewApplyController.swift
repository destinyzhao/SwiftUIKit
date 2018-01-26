//
//  CollectionViewApplyController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/26.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import UIKit

let collectionCellIdentifier = "CollectionApplyCell"

class CollectionViewApplyController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var products = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCollcetion()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCollcetion() -> Void {
        let layout = UICollectionViewFlowLayout.init()
        let width:CGFloat = (UIScreen.main.bounds.width - 20)/2.0
        let height:CGFloat = 245.0;
//        layout.minimumLineSpacing = 5.0
//        layout.minimumInteritemSpacing = 5.0
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        // cell Size
        layout.itemSize = CGSize.init(width: width, height: height)
        
        self.collectionView.collectionViewLayout = layout
        
        // cell
        self.collectionView .register(UINib.init(nibName: collectionCellIdentifier, bundle: nil), forCellWithReuseIdentifier: collectionCellIdentifier)
    }
    
    func loadData() -> Void {
        weak var weakSelf = self
        HomeNetworkService.shareNetworkService.loadProductData { (products) in
            weakSelf!.products = products
            weakSelf!.collectionView!.reloadData()
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

extension CollectionViewApplyController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as! CollectionApplyCell
        cell.product = products[indexPath.item]
        //cell.delegate = self
        return cell
    }
}
