//
//  WXWaterLayout.swift
//  WaterFallDemo
//
//  Created by 魏翔 on 16/3/4.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXWaterLayout: UICollectionViewLayout {
    
    let colNum = 3  //列数
    
    let colMargin = 10 //列间距
    
    let rowMargin = 10 //行间距
    
    let sectionInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //collection内间距
    
    var heightDict = NSMutableDictionary()
    
    var attrsArray = [UICollectionViewLayoutAttributes]()
    
    override init() {
        
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
//        return false
//    }

    //准备布局
    override func prepareLayout() {
        
        super.prepareLayout()
        
        let count = collectionView?.numberOfItemsInSection(0)
        
        //初始化item的高度，并放入heigDict中
        for(var i=0;i<colNum;i++){
            
            let indexPath = NSIndexPath(forItem: i, inSection: 0)

            heightDict[indexPath] = sectionInset.top
        
        }
        
        //将item的布局属性放入attrsArray数组中
        for (var i=0;i<count;i++){
            
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            
            let attr = layoutAttributesForItemAtIndexPath(indexPath)
            
            attrsArray.append(attr!)
            
        }
        
    }
    
    //collectionViewcontentSize设置
    //是将所有item中高度最高的找出来，然后计算frame
    override func collectionViewContentSize() -> CGSize {
        
        var maxHeightLine = NSIndexPath(forRow: 0, inSection: 0)

        heightDict.enumerateKeysAndObjectsUsingBlock { (key, obj, stop) -> Void in
            
            if self.heightDict[maxHeightLine]?.floatValue < obj.floatValue{
                
                maxHeightLine = key as! NSIndexPath
                
            }
            
        }
        
        return CGSizeMake((collectionView?.frame.width)!, CGFloat(heightDict[maxHeightLine]! as! NSNumber) + sectionInset.bottom)
        
    }
    
    //计算并且返回每个item的布局属性
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attr = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        let itemWidth: CGFloat = ((collectionView?.frame.width)! - (sectionInset.left + sectionInset.right) - CGFloat((colNum - 1) * colMargin)) / CGFloat(colNum)
        
        let itemHeight = arc4random() % 800
        
        var minHeightLine = NSIndexPath(forRow: 0, inSection: 0)
        
        heightDict.enumerateKeysAndObjectsUsingBlock { (key, obj, stop) -> Void in
            
            if self.heightDict[minHeightLine]?.floatValue > obj.floatValue{
                
                minHeightLine = key as! NSIndexPath
                
            }
            
        }
        
        attr.frame = CGRectMake(sectionInset.left + CGFloat(minHeightLine.row)*(CGFloat(colMargin) + itemWidth),CGFloat(heightDict[minHeightLine] as! NSNumber), itemWidth, CGFloat(itemHeight))
        
        heightDict[minHeightLine] = attr.frame.height + CGFloat(rowMargin) + CGFloat(heightDict[minHeightLine] as! NSNumber)
        
        return attr
        
    }
    
    //返回属性数组
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return attrsArray
        
    }
    
}
