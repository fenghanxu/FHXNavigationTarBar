//
//  Asserts.swift
//  FHXNavigationTarBar
//
//  Created by 冯汉栩 on 2018/8/3.
//

import UIKit

class Asserts {
  
  static func findImages(named: String) -> UIImage? {
    guard let path = Bundle(for: Asserts.self).path(forResource: "Asserts", ofType: "bundle") else { return nil }
    guard let bundle = Bundle(path: path) else { return nil }
    guard let image = UIImage(named: named, in: bundle, compatibleWith: nil) else { return nil }
    return image
  }
}
