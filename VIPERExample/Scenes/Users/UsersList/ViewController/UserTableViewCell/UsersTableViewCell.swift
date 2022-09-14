//
//  UsersTableViewCell.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import UIKit
import Kingfisher

class UsersTableViewCell: UITableViewCell, UsersCellView {
  
  
  @IBOutlet weak var registrationDate: UILabel!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var userImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    setupImageView()
  }
  
  private func setupImageView() {
    userImageView.layer.cornerRadius = userImageView.frame.height / 2
  }
  
  func configure(viewModel: UserViewModel) {
    userImageView.kf.setImage(with: viewModel.avatar)
    userName.text = viewModel.fullName
    registrationDate.text = viewModel.registrationDate
  }
  
  
}
