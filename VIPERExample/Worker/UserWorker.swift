//
//  UserWorker.swift
//  VIPERExample
//
//  Created by macbook on 11/09/2022.
//

import Foundation

class UserWorker {
  private let networkLayer = NetworkLayer()
  
  func getUsers(completionHandler: @escaping (Result<[User]>) -> ()) {
    networkLayer.request(UserRouter.get, decodeToType: [User].self, completionHandler: completionHandler)
  }
  
  func upadteUsers() {
    
  }
  
  func addUsers() {
    
  }
  
  func deleteUsers() {
    
  }
}
