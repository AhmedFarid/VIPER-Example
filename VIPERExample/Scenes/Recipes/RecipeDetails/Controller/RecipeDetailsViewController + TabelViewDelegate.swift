//
//  RecipeDetailsViewController + TabelViewDelegate.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

extension RecipeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
  func setupTableView() {
    mainView.ingredientsTableView.delegate = self
    mainView.ingredientsTableView.dataSource = self
    mainView.ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
     return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.mainView.ingredients.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let ingredientsCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
      ingredientsCell.backgroundColor = .clear
      ingredientsCell.textLabel?.numberOfLines = 0
      ingredientsCell.textLabel?.textColor = .white
      ingredientsCell.selectionStyle = .none
      ingredientsCell.textLabel?.text = self.mainView.ingredients[indexPath.item] != "" ? self.mainView.ingredients[indexPath.item] : "There's No Ingredients For This Recipes".capitalized
      ingredientsCell.textLabel?.font = UIFont.systemFont(ofSize: 20)
      return ingredientsCell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 40
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let ingredientsHeaderView = IngredientsHeaderView()
      return ingredientsHeaderView
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.item == self.mainView.ingredients.count - 1 {
      self.mainView.calculateScrollHeight()
      }
    
    cell.transform = CGAffineTransform(translationX: -self.mainView.frame.width + 16, y: 0)
      UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [.allowUserInteraction , .curveEaseInOut], animations: {
          cell.transform = .identity
      }, completion: nil)
  }
}

