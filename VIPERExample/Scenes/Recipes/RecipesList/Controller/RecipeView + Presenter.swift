//
//  RecipeView + Presenter.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

extension RecipeViewController :RecipeViewProtocol {
  
  private func showWhiteIndicator(){
    self.activityIndicator.center = self.view.center
    self.view.addSubview(self.activityIndicator)
    self.activityIndicator.startAnimating()
  }
  
  private func hideWhiteIndicator(){
    self.activityIndicator.stopAnimating()
    self.activityIndicator.removeFromSuperview()
  }
  
  func createErrorAlert(withMsg:String) -> UIAlertController {
    let alert = UIAlertController(title: "Error !", message: withMsg, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alert) in
      self.dismiss(animated: true, completion: nil)
    }))
    return alert
  }
  
  func showActivityIndicator() {
    self.view.isUserInteractionEnabled = false
    self.showWhiteIndicator()
  }
  
  func hideActivityIndicator() {
    self.view.isUserInteractionEnabled = true
    self.hideWhiteIndicator()
  }
  
  func reloadTableView() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  func scrollToFirstIndex() {
    DispatchQueue.main.async {
      let indexPath = IndexPath(item: 0, section: 0)
      self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
  }
  
  func dismissSearchController() {
    self.searchController.dismiss(animated: true, completion: nil)
  }
  
  func showError(withMsg: String) {
    print("Error Msg = \(withMsg)")
    DispatchQueue.main.async {
      self.present(self.createErrorAlert(withMsg: withMsg), animated: true, completion: nil)
    }
  }
}
