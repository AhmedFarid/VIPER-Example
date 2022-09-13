//
//  Extension + UIViewController.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import UIKit

extension UIViewController {
  func setStatusBarBackGroundColor(withColor color: UIColor) {
    DispatchQueue.main.async {
      let tag = 12321
      if let taggedView = self.view.viewWithTag(tag) {
        taggedView.removeFromSuperview()
      }
      let overView = UIView()
      overView.frame = (self.view.window?.windowScene?.statusBarManager?.statusBarFrame)!
      overView.backgroundColor = color
      overView.tag = tag
      self.view.addSubview(overView)
    }
  }
}
