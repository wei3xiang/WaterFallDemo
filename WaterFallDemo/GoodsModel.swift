//
//  File.swift
//  WaterFallDemo
//
//  Created by 魏翔 on 16/3/3.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import Foundation

class GoodsModel {
    
    var price: Double
    
    var soldDes: String
    
    var goodsDes: String
    
    init(price: Double, soldDes: String, goodsDes: String){
        
        self.price = price
        
        self.soldDes = soldDes
        
        self.goodsDes = goodsDes
        
    }
    
}