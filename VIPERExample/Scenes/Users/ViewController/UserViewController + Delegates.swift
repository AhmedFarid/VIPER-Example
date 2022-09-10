//
//  UserViewController + Delegates.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import UIKit

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
 
   func setUpTableView() {
    usersTableView.delegate = self
    usersTableView.dataSource = self
    usersTableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersTableViewCell")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = usersTableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
    presenter.configure(cell: cell, indexPath: indexPath)
    return cell
  }
}
