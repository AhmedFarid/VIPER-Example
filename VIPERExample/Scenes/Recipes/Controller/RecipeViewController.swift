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
  
  lazy var activityIndicator : UIActivityIndicatorView = {
    var indicator = UIActivityIndicatorView()
    indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.hidesWhenStopped = true
    indicator.style = .large
    indicator.color = .white
    return indicator
  }()
  
  lazy var searchSuggestionsView: UIView = {
    var view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()
  
  var suggestionViewHeight : NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    self.setupUiBehaviors()
    self.setupSearchController()
    self.registerTableViewCells()
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
    self.navigationItem.hidesSearchBarWhenScrolling = false
  }
  
  func createHeaderBackGroundLabel()-> UILabel {
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

extension RecipeViewController {
  func registerTableViewCells() {
      self.tableView.register(RecipeCell.self, forCellReuseIdentifier: NSStringFromClass(RecipeCell.self))
      self.tableView.register(PaginationSpinner.self, forCellReuseIdentifier: NSStringFromClass(PaginationSpinner.self))
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
      }else{
          guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PaginationSpinner.self), for: indexPath) as? PaginationSpinner else {
              return UITableViewCell()
          }
          presenter.numberOfRows() > 0 ? cell.showPaginationIndicator() : cell.hidePaginationIndicator()
          return cell
      }
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      presenter.didSelect(AtIndexPath: indexPath)
  }

  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      if indexPath.item == presenter.numberOfRows() - 1 {
          guard self.searchController.searchBar.text != nil , self.searchController.searchBar.text != "" else {return}
          presenter.willDisplayLastCell(keyWord: self.searchController.searchBar.text ?? "")
      }
      cell.alpha = 0
      UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction , .curveEaseInOut], animations: {
          cell.alpha = 1
      }, completion: nil)

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
}

extension RecipeViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let unwrappedKeyWord = searchBar.text {
            presenter.searchData(withKeyWord: unwrappedKeyWord)
        }
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        presenter.clearDataSourceOnCancel()
    }
}



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
    //ShowIndicator
    self.view.isUserInteractionEnabled = false
    self.showWhiteIndicator()
  }
  
  func hideActivityIndicator() {
    //HideIndicator
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
