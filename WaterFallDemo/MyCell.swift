//
//  CollectionViewCell.swift
//  WaterFallDemo
//
//  Created by 魏翔 on 16/3/3.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var soldDescribtionLabel: UILabel!

    @IBOutlet weak var goodsDesLabel: UILabel!
    
    var goodsModel: GoodsModel?{
    
        didSet{
            
            goodsModelKVO()
            
        }
    
    }
    
    func goodsModelKVO(){
        
        let soldDes = goodsModel!.soldDes
        
        priceLabel.text = "\(goodsModel!.price)"
        
        soldDescribtionLabel.text = soldDes
        
        goodsDesLabel.text = goodsModel!.goodsDes
        
    }
    
}
