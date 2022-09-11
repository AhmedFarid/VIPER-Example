//
//  UsersPresenter.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import Foundation

class UsersPresenter: UsersPresenterProtocol, UsersInteractorOutputProtocol {
  
  
  weak var view: UsersViewProtocol?
  private let interactor: UsersInteractorInputProtocol
  private let router: UsersRouterProtocol
  
  var numberOfRows: Int {
    return users.count
  }
  
  private var users = [User]()
  
  init(view: UsersViewProtocol,interactor: UsersInteractorInputProtocol,router: UsersRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
  
  func viewDidLoad() {
    // get data
    view?.showLoadingIndicator()
    interactor.getUsers()
  }
  
  func userFetchedSuccessFully(users: [User]) {
    view?.hideLoadingIndicator()
    self.users.append(contentsOf: users)
    view?.reloadData()
  }
  
  func userFetchingFailed(with error: Error) {
    view?.hideLoadingIndicator()
  }
  
  func configure(cell: UsersCellView, indexPath: IndexPath) {
    let user = users[indexPath.row]
    let viewModel = UserViewModel(user: user)
    cell.configure(viewModel: viewModel)
  }
  
  func didSelectRow(indexPath: IndexPath) {
    let user = users[indexPath.row]
    router.navigateToDetailsView(withUser: user)
  }

}
