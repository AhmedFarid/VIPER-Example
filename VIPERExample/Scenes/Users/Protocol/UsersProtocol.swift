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
}

protocol UsersRouterProtocol {
  
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