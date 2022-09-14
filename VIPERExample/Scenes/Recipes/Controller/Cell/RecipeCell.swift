//
//  RecipeCell.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import UIKit
import Kingfisher

class RecipeCell: UITableViewCell {
  lazy var recipeImage: UIImageView = {
    var iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.backgroundColor = .gray
    iv.clipsToBounds = true
    iv.layer.cornerRadius = 12
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.kf.indicatorType = .activity
    return iv
  }()
  
  lazy var stackView: UIStackView = {
    var infoStack = UIStackView()
    infoStack.distribution = .fill
    infoStack.axis = .vertical
    infoStack.alignment = .fill
    infoStack.spacing = 2
    infoStack.translatesAutoresizingMaskIntoConstraints = false
    return infoStack
  }()
  
  lazy var recipeName: UILabel = {
    var nameLabel = UILabel()
    nameLabel.text = "Recipe Name"
    nameLabel.numberOfLines = 2
    nameLabel.textColor = .white
    nameLabel.font = UIFont.systemFont(ofSize: 17)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    return nameLabel
  }()
  
  lazy var recipeSource: UILabel = {
    var sourceLabel = UILabel()
    sourceLabel.text = "Recipe Source"
    sourceLabel.textColor = .white
    sourceLabel.font = UIFont.systemFont(ofSize: 14)
    sourceLabel.translatesAutoresizingMaskIntoConstraints = false
    return sourceLabel
  }()
  
  lazy var recipeHealthLabel: UILabel = {
    var healthLabel = UILabel()
    healthLabel.text = "Health label"
    healthLabel.font = UIFont.systemFont(ofSize: 12)
    healthLabel.numberOfLines = 0
    healthLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    healthLabel.translatesAutoresizingMaskIntoConstraints = false
    return healthLabel
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCellBehaviors()
    layoutUserInterface()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layoutUserInterface() {
    addSubViews()
    setupRecipeImage()
    setupStackView()
    addArrangedViews()
  }
  
  private func addSubViews() {
    addSubview(recipeImage)
    addSubview(stackView)
  }
  
  private func setupRecipeImage() {
    NSLayoutConstraint.activate([
      recipeImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
      recipeImage.heightAnchor.constraint(equalToConstant: 100),
      recipeImage.widthAnchor.constraint(equalToConstant: 100),
      recipeImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
    ])
  }
  
  private func setupStackView() {
    NSLayoutConstraint.activate([
      stackView.leftAnchor.constraint(equalTo: self.recipeImage.rightAnchor, constant: 8),
      stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
      stackView.centerYAnchor.constraint(equalTo: self.recipeImage.centerYAnchor, constant: 0),
      stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
    ])
  }
  
  private func addArrangedViews() {
    stackView.addArrangedSubview(recipeName)
    stackView.addArrangedSubview(recipeSource)
    stackView.addArrangedSubview(recipeHealthLabel)
  }
  
  private func setupCellBehaviors() {
    self.backgroundColor = .clear
    self.selectionStyle = .none
  }
  
}


extension RecipeCell : RecipesCellView {
  func configureRecipeCell(recipe: Hits) {
    if let recipe = recipe.recipe {
      recipeName.text = recipe.label ?? ""
      recipeSource.text = recipe.source ?? ""
      recipeImage.kf.setImage(with: URL(string: recipe.image ?? ""))
      let recipeHealthText = recipe.healthLabels?.reduce("", {$0 + $1 + " - "})
      recipeHealthLabel.text = recipeHealthText
    }
  }
}
