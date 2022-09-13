//
//  RecipeEntity.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import Foundation
class RecipeModel: Codable {
    let q : String?
    let from : Int?
    let to : Int?
    let more : Bool?
    let count : Int?
    let hits: [Hits]?
}

struct Hits: Codable{
    let recipe: Recipe?
    let bookmarked, bought: Bool?
}

struct Recipe: Codable {
    let image: String?
    let label: String?
    let shareAs: String?
    let source: String?
    let healthLabels: [String]?
    let ingredientLines : [String]?
}
