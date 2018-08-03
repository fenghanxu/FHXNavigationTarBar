//
//  Color.swift
//  FHXNavigationTarBar
//
//  Created by 冯汉栩 on 2018/8/3.
//

import UIKit

class Color: UIColor {

  static let textBlack = UIColor(value: 0x333333)
  
  static let theme = UIColor(value: 0x78885b)
  
}

extension UIColor{
  
  /// 十六进制色: 0x666666
  ///
  /// - Parameter RGBValue: 十六进制颜色
  convenience init(value: UInt) {
    self.init(
      red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(value & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
}
