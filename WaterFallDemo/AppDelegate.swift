//
//  AppDelegate.swift
//  WaterFallDemo
//
//  Created by 魏翔 on 16/3/3.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let navVC = UINavigationController()
        
        let homeVC = MainVC.init(nibName: "MainVC", bundle: nil)
        
        navVC.viewControllers = [homeVC]
        
        window.rootViewController = navVC
        
        self.window = window
        
        window.makeKeyAndVisible()
        
        return true
    }
}

