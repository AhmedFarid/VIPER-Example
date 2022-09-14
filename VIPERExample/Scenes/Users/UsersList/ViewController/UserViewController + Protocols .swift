//
//  UserViewController + Protocols .swift
//  VIPERExample
//
//  Created by macbook on 11/09/2022.
//

import UIKit

extension UsersViewController: UsersViewProtocol {
  func showLoadingIndicator() {
    print("loading.........")
  }
  
  func hideLoadingIndicator() {
    print(".........stop")
  }
  
  func reloadData() {
    usersTableView.reloadData()
  }
  
}
