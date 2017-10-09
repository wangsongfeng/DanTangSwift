//
//  YMNeeViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/4.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class YMNeeViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

   
}

private class NewFeatureLayout : UICollectionViewFlowLayout {
    fileprivate override func prepare() {
        itemSize=UIScreen.main.bounds.size
        minimumLineSpacing=0
        minimumInteritemSpacing=0
        scrollDirection = .horizontal
        collectionView?.showsVerticalScrollIndicator=false
        collectionView?.showsHorizontalScrollIndicator=false
        collectionView?.isPagingEnabled=true
        collectionView?.bounces=false
        
    }
}

