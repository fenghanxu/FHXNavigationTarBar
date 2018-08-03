//
//  AppDelegate.swift
//  FHXNavigationTarBar
//
//  Created by fenghanxu on 08/03/2018.
//  Copyright (c) 2018 fenghanxu. All rights reserved.
//

import UIKit
import FHXNavigationTarBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      //创建一个window
      let window = UIWindow()
      //指定win
      self.window = window
      //创建一个控制器
            let tarBarVC = FHXTabBarViewController()
            tarBarVC.setChildVC(vc: RedVC(), name: "红色", image: "tab_Shopcart_normal", selectImage: "tab_Shopcart_selected")
            tarBarVC.setChildVC(vc: GreenVC(), name: "绿色", image: "tab_myprofile_normal", selectImage: "tab_myprofile_selected")
            tarBarVC.setChildVC(vc: OrangeVC(), name: "橙色", image: "tab_msg_normal", selectImage: "tab_msg_selected_red")
            tarBarVC.setChildVC(vc: YellowVC(), name: "黄色", image: "tab_home_normal", selectImage: "tab_home_selected")
            //把nva添加到win中
            window.rootViewController = tarBarVC
      
//      window.rootViewController = FHXNavigationController(rootViewController: RedVC())
      //启动win
      window.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

