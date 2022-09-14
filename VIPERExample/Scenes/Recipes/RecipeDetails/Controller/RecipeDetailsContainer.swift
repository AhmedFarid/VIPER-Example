//
//  RecipeDetailsContainer.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit
import Kingfisher

class RecipeDetailsContainer: UIView {
  
  var containerHeight: NSLayoutConstraint?
  
  let scrollView: UIScrollView = {
    let v = UIScrollView()
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
  }()
  
  lazy var containerView: UIView = {
    var container = UIView()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.backgroundColor = .clear
    return container
  }()
  
  lazy var recipeImageView: UIImageView = {
    var image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .gray
    image.layer.cornerRadius = 14
    image.kf.indicatorType = .activity
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    return image
  }()
  
  lazy var publisherLabel: UILabel = {
    var bu = UILabel()
    bu.translatesAutoresizingMaskIntoConstraints = false
    bu.text = ""
    bu.textColor = .white
    bu.textAlignment = .left
    bu.font = UIFont.systemFont(ofSize: 20)
    bu.numberOfLines = 2
    return bu
  }()
  
  lazy var ingredientsTableView: UITableView = {
    var tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.separatorStyle = .none
    return tableView
  }()
  
  var recipeImage: String = "" {
    didSet {
      DispatchQueue.main.async {
        self.recipeImageView.kf.setImage(with: URL(string: self.recipeImage))
      }
    }
  }
  
  var publisherUrl: String = "" {
    didSet {
      DispatchQueue.main.async {
        self.publisherLabel.text = self.publisherUrl
      }
    }
  }
  
  var ingredients: [String] = [""] {
    didSet {
      DispatchQueue.main.async {
        self.ingredientsTableView.reloadData()
        self.calculateScrollHeight()
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .black
    self.layOutUserInterface()
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
      self.calculateScrollHeight()
  }
  
  private func layOutUserInterface(){
      self.addSubViews()
      self.setupScrollView()
      self.setupContainerView()
      self.setupRecipeImage()
      self.setupPublisherLabel()
      self.setupIngredientsTableView()
      self.animateRecipeImage()
  }
  
  private func addSubViews() {
    self.addSubview(self.scrollView)
    self.scrollView.addSubview(self.containerView)
    self.containerView.addSubview(self.recipeImageView)
    self.containerView.addSubview(self.publisherLabel)
    self.containerView.addSubview(self.ingredientsTableView)
  }
  
  private func setupScrollView() {
    scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    scrollView.topAnchor.constraint(equalTo: self.topAnchor,constant: 0).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
  }
  
  private func setupContainerView() {
    containerView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0).isActive = true
    containerView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0).isActive = true
    containerView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0).isActive = true
    containerView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0).isActive = true
    containerView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1).isActive = true
    self.containerHeight = containerView.heightAnchor.constraint(equalToConstant: 2000)
    self.containerHeight?.isActive = true
  }
  
  private func setupRecipeImage() {
    NSLayoutConstraint.activate([
      self.recipeImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor,constant: 16),
      self.recipeImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor,constant: 16),
      self.recipeImageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor,constant: -16),
      self.recipeImageView.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  private func setupPublisherLabel() {
    NSLayoutConstraint.activate([
      self.publisherLabel.leftAnchor.constraint(equalTo: self.recipeImageView.leftAnchor, constant: 16),
      self.publisherLabel.rightAnchor.constraint(equalTo: self.recipeImageView.rightAnchor, constant: -16),
      self.publisherLabel.bottomAnchor.constraint(equalTo: self.recipeImageView.bottomAnchor, constant: -16)
    ])
  }
  
  private func setupIngredientsTableView() {
    self.ingredientsTableView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor,constant: -32).isActive = true
    self.ingredientsTableView.topAnchor.constraint(equalTo: self.recipeImageView.bottomAnchor, constant: 8).isActive = true
    self.ingredientsTableView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 32).isActive = true
    self.ingredientsTableView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0).isActive = true
    self.ingredientsTableView.isScrollEnabled = false
  }
  
  func calculateScrollHeight() {
    DispatchQueue.main.async {
      self.containerHeight?.isActive = false
      self.containerHeight?.constant = self.ingredientsTableView.contentSize.height + 200 + 16 + 8 + 16
      self.containerHeight?.isActive = true
      self.layoutIfNeeded()
    }
  }
  
  func animateRecipeImage() {
    self.recipeImageView.transform = CGAffineTransform(translationX: 0, y: -400)
    UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [.allowUserInteraction , .curveEaseInOut], animations: {
        self.recipeImageView.transform = .identity
    }, completion: nil)
  }
}
