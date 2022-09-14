//
//  RecipeView + SearchBar.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

extension RecipeViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      if let unwrappedKeyWord = searchBar.text {
          presenter.searchData(withKeyWord: unwrappedKeyWord)
      }
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    presenter.clearDataSourceOnCancel()
  }
}
