//
//  RedVC.swift
//  FHXNavigationAndTabBar_Example
//
//  Created by 冯汉栩 on 2018/8/3.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class RedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
      
      let btn = UIButton()
      btn.setTitle("blue", for: .normal)
      btn.setTitleColor(UIColor.white, for: .normal)
      btn.backgroundColor = UIColor.blue
      btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
      btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
      view.addSubview(btn)
    }

  @objc func btnClick(){
    navigationController?.pushViewController(BlueVC(), animated: true)
  }
    



}
