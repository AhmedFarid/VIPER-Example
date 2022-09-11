//
//  UsersProtocol.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import Foundation

protocol UsersViewProtocol: AnyObject {
  var presenter: UsersPresenterProtocol! { get set }
  func showLoadingIndicator()
  func hideLoadingIndicator()
  func reloadData()
}

protocol UsersPresenterProtocol: AnyObject {
  var view: UsersViewProtocol? { get set }
  var numberOfRows: Int { get }
  func viewDidLoad()
  func configure(cell: UsersCellView, indexPath: IndexPath)
  func didSelectRow(indexPath: IndexPath)
}

protocol UsersRouterProtocol {
  func navigateToDetailsView(from view: UsersViewProtocol? ,withUser: User)
}

protocol UsersInteractorInputProtocol {
  var presenter: UsersInteractorOutputProtocol? { get set }
  func getUsers()
}

protocol UsersInteractorOutputProtocol: AnyObject {
  func userFetchedSuccessFully(users: [User])
  func userFetchingFailed(with error: Error)
}

// Input = Interactor Protocol
// OutPut = Presenter

protocol UsersCellView {
  func configure(viewModel: UserViewModel)
}
