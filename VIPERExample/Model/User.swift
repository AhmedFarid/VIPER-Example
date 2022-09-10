//
//  User.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import Foundation

//{
//"id": 1,
//"": "Leanne Graham",
//"": "Bret",
//"email": "Sincere@april.biz",
//"address": {},
//"phone": "1-770-736-8031 x56442",
//"website": "hildegard.org",
//"company": {}
//},


class User: Codable {
  var id: Int?
  var name: String?
  var username: String?
  var avatar: String?
  var creationDate: Int?
}

struct UserViewModel {
  var fullName: String
  var avatar: URL?
  var registrationDate: String
  
  let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-DD"
    return dateFormatter
  }()
  
  init(user: User) {
    fullName = (user.name ?? "") + (user.username ?? "")
    avatar = URL(string: user.avatar ?? "")
    registrationDate = "Registration Date: \(dateFormatter.string(from: Date(timeIntervalSince1970: Double(user.creationDate ?? 0))))"
  }
}


