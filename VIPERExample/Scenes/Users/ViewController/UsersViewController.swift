//
//  UsersViewController.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import UIKit

class UsersViewController: UIViewController {
  
  var presenter: UsersPresenterProtocol!
  
  
  @IBOutlet weak var usersTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTableView()
    presenter.viewDidLoad()
  }
}
