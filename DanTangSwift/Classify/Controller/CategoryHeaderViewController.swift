//
//  CategoryHeaderViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/16.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class CategoryHeaderViewController: DTBaseViewController {

    var collectionItems = [DTCollections]()
    
    var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUI()
        DTNetWorkTool.shareNetWorkTool.loadCategoryCollect(limit: 6) { (collectionItems) in
            self.collectionItems = collectionItems
            self.collectionView?.reloadData()
        }

    }

    private func setUI() {
        let headerView = Bundle.main.loadNibNamed(String(describing: CategoryTopHeaderView.self), owner: nil, options: nil)?.last as? CategoryTopHeaderView
        headerView?.frame = CGRect.init(x: 0, y: 0, width: SCREENW, height: 40)
        headerView?.delegate = self
        view.addSubview(headerView!)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 40, width: SCREENW, height: 95), collectionViewLayout: flowLayout)
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor=DTGlobalColor()
        let nib = UINib.init(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
    }
}
//查看全部 代理
extension CategoryHeaderViewController : CategoryTopHeaderViewDelegate{
    func topViewDidClickWithButton(button: UIButton) {
        print("查看全部")
    }
}
//collection View Delegate
extension CategoryHeaderViewController : UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as? CategoryCollectionViewCell
        cell?.collionItem = self.collectionItems[indexPath.row]
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 150, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
}





