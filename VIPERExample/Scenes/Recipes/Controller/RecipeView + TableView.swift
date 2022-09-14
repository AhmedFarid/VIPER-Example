//
//  RecipeView + TableView.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

extension RecipeViewController {
  
  func registerTableViewCells() {
    self.tableView.register(RecipeCell.self, forCellReuseIdentifier: NSStringFromClass(RecipeCell.self))
    self.tableView.register(PaginationSpinner.self, forCellReuseIdentifier: NSStringFromClass(PaginationSpinner.self))
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return createHeaderBackGroundLabel()
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return indexPath.section == 0 ? 132 : 40
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return section == 0 ? self.presenter.numberOfRows() > 0 ? 0 : 300 : 0
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? presenter.numberOfRows() : 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(RecipeCell.self), for: indexPath) as? RecipeCell else {
        return UITableViewCell()
      }
      presenter.configure(recipesCell: cell, AtIndexPath: indexPath)
      return cell
    }else {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PaginationSpinner.self), for: indexPath) as? PaginationSpinner else {
        return UITableViewCell()
      }
      presenter.numberOfRows() > 0 ? cell.showPaginationIndicator() : cell.hidePaginationIndicator()
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
