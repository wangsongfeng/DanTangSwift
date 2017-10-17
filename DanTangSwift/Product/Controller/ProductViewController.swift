//
//  ProductViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
class ProductViewController: DTBaseViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    var productItem = [ProductModel]()
    var mainCollectView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupCollectView()
        weak var weakSelf = self
        DTNetWorkTool.shareNetWorkTool.loadProductData { (productItem) in
            weakSelf?.productItem=productItem
            weakSelf?.mainCollectView?.reloadData()
        }
    }

    private func setupCollectView() {
        let collectView = UICollectionView.init(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectView.delegate=self
        collectView.dataSource=self
        collectView.backgroundColor=DTGlobalColor()
        collectView.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        view.addSubview(collectView)
       self.mainCollectView = collectView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productItem.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCollectionViewCell
        cell?.product = productItem[indexPath.row]
        return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = (UIScreen.main.bounds.size.width-20)/2
        let height :CGFloat = 245
        return CGSize.init(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5 )
    }
}
