//
//  UserDetailsViewController.swift
//  VIPERExample
//
//  Created by Macintosh on 11/09/2022.
//

import UIKit

class UserDetailsViewController: UIViewController {
  
  var presenter: UserDetailsPresenterProtocol!
  
  @IBOutlet weak var userNameLB: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
  }
}

extension UserDetailsViewController: UserDetailsViewProtocol {
  func updateUser(name: String) {
    self.userNameLB.text = name
  }
  
  func showLoadingIndicator() {
    print("loading")
  }
  
  func hideLoadingIndicator() {
    print("stop")
  }
}
