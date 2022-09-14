//
//  PaginationSpinner.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import UIKit

class PaginationSpinner: UITableViewCell {
  
  lazy var activityIndicator: UIActivityIndicatorView = {
    var indicator = UIActivityIndicatorView()
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.hidesWhenStopped = true
    indicator.style = .medium
    indicator.color = .white
    return indicator
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      self.backgroundColor = .clear
      self.addSubview(self.activityIndicator)
      self.setupSpinnerConstrains()
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func showPaginationIndicator() {
    activityIndicator.startAnimating()
  }
  
  func hidePaginationIndicator() {
    activityIndicator.stopAnimating()
  }
  
  private func setupSpinnerConstrains() {
    NSLayoutConstraint.activate([
      activityIndicator.heightAnchor.constraint(equalToConstant: 40),
      activityIndicator.widthAnchor.constraint(equalToConstant: 40),
      activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
}
