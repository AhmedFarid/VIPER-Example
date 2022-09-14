//
//  IngredientsHeaderView.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

class IngredientsHeaderView : UIView {
    let headerLabel : UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "ingredients"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubViews(){
        self.addSubview(self.headerLabel)
    }
    private func layoutUserInterface(){
        self.addSubViews()
        self.setupHeaderLabel()
    }
    
    private func setupHeaderLabel() {
        NSLayoutConstraint.activate([
            self.headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            self.headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            self.headerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
        ])
    }
}
