//
//  RecommendationView.swift
//  Insagram
//
//  Created by Kirill Dev on 06.03.2023.
//

import UIKit

final class RecommendationView: UIView {
  
  // MARK: - Private
  private let hideButton = UIButton()
  private let avatarImage = UIImageView()
  private let nickLabel = UILabel()
  private let subscribeButton = UIButton()
  
  // MARK: - Override init
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .black
    self.setConstraints()
    self.setUI()
  }
  
 @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Setup Constraints
  private func setConstraints() {
    [hideButton, avatarImage, nickLabel, subscribeButton].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      hideButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
      hideButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
      hideButton.widthAnchor.constraint(equalToConstant: 23),
      hideButton.heightAnchor.constraint(equalToConstant: 20),
      
      avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      avatarImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
      avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      avatarImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
    
      nickLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 5),
      nickLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      subscribeButton.topAnchor.constraint(equalTo: nickLabel.bottomAnchor, constant: 15),
      subscribeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      subscribeButton.widthAnchor.constraint(equalToConstant: 95),
      subscribeButton.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  // MARK: - Setup UI
  private func setUI() {
    avatarImage.image = UIImage(named: "avatar1")?.withRoundedCorners()
    hideButton.setImage(UIImage(systemName: "cross"), for: .normal)
    hideButton.tintColor = .lightGray
    nickLabel.textColor = .white
    nickLabel.font = .boldSystemFont(ofSize: 13)
    subscribeButton.setTitle("subscribe", for: .normal)
    subscribeButton.layer.cornerRadius = 8
    subscribeButton.backgroundColor = .systemBlue
  }
  
  // MARK: - Configure
  func configure(post: Post) {
    avatarImage.image = post.postImage.withRoundedCorners()
    nickLabel.text = post.nickname
  }
}
