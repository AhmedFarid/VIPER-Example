//
//  RecipeViewController.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import UIKit

class RecipeViewController: UITableViewController {
  
  
  var presenter: RecipePresenterProtocol!
  
  lazy var searchController = UISearchController(searchResultsController: nil)
  
  lazy var activityIndicator: UIActivityIndicatorView = {
      var indicator = UIActivityIndicatorView()
    indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.hidesWhenStopped = true
    indicator.style = .large
    indicator.color = .white
    return indicator
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    setupUiBehaviors()
    setupSearchController()
    registerTableViewCells()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.setupNavigationBarBehaviors()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    self.title = " "
  }
  
  private func setupUiBehaviors() {
    self.view.backgroundColor = .black
  }
  
  private func setupNavigationBarBehaviors() {
    self.title = "Recipe"
  }
  
  private func setupSearchController() {
    searchController.searchBar.delegate = self
    searchController.searchBar.searchTextField.textColor = .white
    navigationItem.searchController = searchController
    searchController.definesPresentationContext = false
    navigationItem.hidesSearchBarWhenScrolling = false
  }
  
  func createHeaderBackGroundLabel() -> UILabel {
    let headerBackGroundLabel = UILabel()
    headerBackGroundLabel.backgroundColor = .clear
    headerBackGroundLabel.text = "There's No Data , Please search to refresh content"
    headerBackGroundLabel.font = UIFont.systemFont(ofSize: 20)
    headerBackGroundLabel.textAlignment = .center
    headerBackGroundLabel.numberOfLines = 2
    headerBackGroundLabel.textColor = .white
    return headerBackGroundLabel
  }
}

