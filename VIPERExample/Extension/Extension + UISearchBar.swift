//
//  Extension + UISearchBar.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import UIKit

extension UISearchBar {
  
  func setNewColor(color: UIColor) {
    let clrChange = subviews.flatMap { $0.subviews }
    guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
    sc.textColor = color
  }
}
