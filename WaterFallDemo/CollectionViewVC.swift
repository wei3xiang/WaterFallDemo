//
//  CollectionViewVC.swift
//  WaterFallDemo
//
//  Created by 魏翔 on 16/3/3.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MyCell"

var models: [GoodsModel]?

class CollectionViewVC: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let m1 = GoodsModel(price: 10, soldDes: "1", goodsDes: "养生有机营养")
        
        let m2 = GoodsModel(price: 38, soldDes: "2", goodsDes: "长城红酒解百纳")
        
        let m3 = GoodsModel(price: 28, soldDes: "3", goodsDes: "百年张裕赤霞珠")
        
        let m4 = GoodsModel(price: 5, soldDes: "4", goodsDes: "xxxxxxxxx")
        
        let m5 = GoodsModel(price: 39.9, soldDes: "5", goodsDes: "长康压榨菜籽油")
        
        let m6 = GoodsModel(price: 39.9, soldDes: "6", goodsDes: "长康压榨菜籽油")
        
        let m7 = GoodsModel(price: 5, soldDes: "7", goodsDes: "xxxxxxxxx")
        
        let m8 = GoodsModel(price: 39.9, soldDes: "8", goodsDes: "长康压榨菜籽油")
        
        let m9 = GoodsModel(price: 39.9, soldDes: "9", goodsDes: "长康压榨菜籽油")
        
        models = [m1,m2,m3,m4,m5,m6,m7,m8,m9]
        
        self.collectionView?.collectionViewLayout = WXWaterLayout()
        
        collectionView?.backgroundColor = UIColor.grayColor()
        
        self.collectionView!.registerNib(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
    }
        
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return models!.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        as! MyCell
        
        cell.goodsModel = models![indexPath.row]
        
        cell.backgroundColor = UIColor.greenColor()
    
        return cell
    }

}
