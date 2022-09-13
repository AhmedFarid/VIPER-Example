//
//  BaseNavigationController.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBarBehaviors()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
      .lightContent
  }
  
  private func setupNavigationBarBehaviors() {
    self.navigationBar.prefersLargeTitles = true
    self.navigationBar.backgroundColor = #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1)
    self.navigationBar.barTintColor = #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1)
    self.navigationBar.tintColor = .white
    self.navigationBar.isTranslucent = false
    let textAttributeWhenSmallTittle = [NSAttributedString.Key.foregroundColor:UIColor.white , NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
    self.navigationBar.titleTextAttributes = textAttributeWhenSmallTittle as [NSAttributedString.Key : Any]
    let textAttributeWhenLargeTitle = [NSAttributedString.Key.foregroundColor:UIColor.white , NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)]
    self.navigationBar.largeTitleTextAttributes = textAttributeWhenLargeTitle as [NSAttributedString.Key : Any]
    self.setStatusBarBackGroundColor(withColor: #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1))
  }
}
