//
//  FHXNavigationController.swift
//  sharesChonse
//
//  Created by 冯汉栩 on 2018/7/13.
//  Copyright © 2018年 fenghanxuCompany. All rights reserved.
//

import UIKit


public class FHXNavigationController: UINavigationController,UINavigationControllerDelegate {
  
  /// 是否正在动画(防止连续点击)
  var isSwitching: Bool = false
  //不支持旋屏
  override public var shouldAutorotate: Bool { return false }
  //设置屏幕竖向
  override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation { return .portrait }
  //设置屏幕竖向
  override public var supportedInterfaceOrientations: UIInterfaceOrientationMask{ return .portrait }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    //自己内部遵守代理方法实现需要的要求，平时外面使用的时候也有自己的要求，想TextField的封装一样
    delegate = self
    //false  不透明   true   半透明
    navigationBar.isTranslucent = false
    //背景颜色
    navigationBar.backgroundColor = UIColor.white
    //隐藏导航栏下面底部的线shadowImage,(官方文档对顶设置完之后要一起设置setBackgroundImage才生效)
    navigationBar.shadowImage = Asserts.findImages(named: "nav-shadowImage") ?? UIImage()
    navigationBar.setBackgroundImage(UIImage.initWith(color: UIColor.white), for: .default)
    //设置tabbar标题字体(大小,颜色) 中间的标题文字
    navigationBar.titleTextAttributes = [.foregroundColor: UIColor.darkText,
                                         .font: UIFont.systemFont(ofSize: 17)]
  }
  
  override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
    if isSwitching { return }
    isSwitching = true
    //如果导航栏集合里面不止一个控制器的话就在当前控制器的左边增加一个按键(可能会失去右滑返回手势)
    if self.childViewControllers.count > 0 {
//      viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(),
//                                                                        style: .plain,
//                                                                        target: self,
//                                                                        action: #selector(backBtnClick))
      viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: Asserts.findImages(named: "nav_back") ?? UIImage(),
                                                                        style: .plain,
                                                                        target: self,
                                                                        action: #selector(backBtnClick))
      viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.darkText
    }else {
      isSwitching = false
    }
    super.pushViewController(viewController, animated: animated)
  }
  
  // 这是导航每次发生跳转都调用该函数
  public func navigationController(_ navigationController: UINavigationController,
                            didShow viewController: UIViewController,
                            animated: Bool) {
    // 当前页控制器和跳转后的控制器
    //    SPLogs("当前页控制器 = \(navigationController),跳转后的控制器 = \(viewController)")
    isSwitching = false
  }

}

extension FHXNavigationController {
  
  @objc func backBtnClick() {
    self.popViewController(animated: true)
  }
}

extension UIImage {
  
  class func initWith(color: UIColor,
                      size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
    if size.width <= 0 || size.height <= 0 {
      return UIImage()
    }
    let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    guard let context: CGContext = UIGraphicsGetCurrentContext() else {
      UIGraphicsEndImageContext()
      return UIImage()
    }
    context.setFillColor(color.cgColor)
    context.fill(rect)
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
      UIGraphicsEndImageContext()
      return UIImage()
    }
    UIGraphicsEndImageContext()
    return image
  }

}

