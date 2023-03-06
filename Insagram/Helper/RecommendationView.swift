//
//  RecommendationView.swift
//  Insagram
//
//  Created by Kirill Dev on 06.03.2023.
//

import UIKit

final class RecommendationView: UIView {
  
  private let hideButton = UIButton()
  private let avatarImage = UIImageView()
  private let nickLabel = UILabel()
  private let recomendLabel = UILabel()
  private let subscribeButton = UIButton()
  
  private func setConstraints() {
    [hideButton, avatarImage, nickLabel, recomendLabel, subscribeButton].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      hideButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
      hideButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -5),
      
      avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      avatarImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
      avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -10),
      avatarImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 50)
    
    ])
    
  }
  
  func setUI() {
    
  }
}
