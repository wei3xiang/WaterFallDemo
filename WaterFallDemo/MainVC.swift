//
//  MainVC.swift
//  WaterFallDemo
//
//  Created by 魏翔 on 16/3/3.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        
        view.backgroundColor = UIColor.greenColor()

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let collectionVC = CollectionViewVC.init(nibName: "CollectionViewVC", bundle: nil)
        
        navigationController?.pushViewController(collectionVC, animated: true)
        
    }
}
