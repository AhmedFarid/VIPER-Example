//
//  NetworkLayerRecipes.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import Foundation
import Alamofire

class NetworkLayerRecipes {
  static let instance = NetworkLayerRecipes()
  
  func fetchData<T: Decodable>(url: String, completion: @escaping(T?, Error?) -> Void) {
    AF.request(url, method: .get).response { (response) in
      switch response.result {
      case .success(_):
        do {
          guard let data = response.data else { return }
          let dataModel = try JSONDecoder().decode(T.self, from: data)
          completion(dataModel,nil)
        }catch let jsonError {
          completion(nil, jsonError)
        }
      case .failure(let error):
        completion(nil, error)
      }
    }
  }
}
