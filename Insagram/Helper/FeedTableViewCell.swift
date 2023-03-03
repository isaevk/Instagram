//
//  FeedTableViewCell.swift
//  Insagram
//
//  Created by Kirill Dev on 01.03.2023.
//

import UIKit

final class FeedTableViewCell: UITableViewCell {

  private let avatarTopImageView = UIImageView()
  private let postPhotoImageView = UIImageView()
  private let likesButton = UIButton()
  private let commentsButton = UIButton()
  private let shareButton = UIButton()
  private let bookmarkButton = UIButton()
  private let avatarBottomImageView = UIImageView()
  private let addCommentTextField = UITextField()
  private let emojiFastReactionButton = UIButton()
  
  private let nicknameTopLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.font = .boldSystemFont(ofSize: 15)
    nameLabel.textColor = .white
    return nameLabel
  }()
  
  private let editButton: UIButton = {
    let editButton = UIButton()
    editButton.tintColor = .white
    editButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
    editButton.scalesLargeContentImage = true
    return editButton
  }()

  private let likesLabel: UILabel = {
    let likesLabel = UILabel()
    likesLabel.textColor = .white
    likesLabel.font = .boldSystemFont(ofSize: 18)
    return likesLabel
  }()
  
  private let nicknameBottomLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.textColor = .white
    nameLabel.font = .boldSystemFont(ofSize: 16)
    return nameLabel
    
  }()
  
  private let signedLabel: UILabel = {
    let signedLabel = UILabel()
    signedLabel.textColor = .white
    signedLabel.font = .systemFont(ofSize: 16)
    return signedLabel
  }()
  
  private let seeCommentButton: UIButton = {
    let commentButton = UIButton()
    commentButton.setTitle("See comments", for: .normal)
    commentButton.setTitleColor(.systemGray, for: .normal)
    return commentButton
  }()

  private let timeBackLabel: UILabel = {
    let timeLabel = UILabel()
    timeLabel.text = "5 minutes ago"
    timeLabel.textColor = .systemGray
    timeLabel.font = .boldSystemFont(ofSize: 14)
    return timeLabel
  }()

  // MARK: - Override init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Constraints
  private func setConstraints() {
    [avatarTopImageView, nicknameTopLabel, editButton, postPhotoImageView, likesButton, commentsButton, shareButton, bookmarkButton, likesLabel, nicknameBottomLabel, signedLabel, seeCommentButton, avatarBottomImageView, addCommentTextField, emojiFastReactionButton, timeBackLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      avatarTopImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      avatarTopImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      avatarTopImageView.widthAnchor.constraint(equalToConstant: 32),
      avatarTopImageView.heightAnchor.constraint(equalToConstant: 32),
      
      nicknameTopLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      nicknameTopLabel.leadingAnchor.constraint(equalTo: avatarTopImageView.trailingAnchor, constant: 10),
      nicknameTopLabel.heightAnchor.constraint(equalToConstant: 20),
      nicknameTopLabel.widthAnchor.constraint(equalToConstant: 120),
      
      editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
      editButton.heightAnchor.constraint(equalToConstant: 20),
      editButton.widthAnchor.constraint(equalToConstant: 20),
      
      postPhotoImageView.topAnchor.constraint(equalTo: avatarTopImageView.bottomAnchor, constant: 10),
      postPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
      postPhotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
      postPhotoImageView.heightAnchor.constraint(equalToConstant: 350),
      
      likesButton.topAnchor.constraint(equalTo: postPhotoImageView.bottomAnchor, constant: 5),
      likesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      likesButton.widthAnchor.constraint(equalToConstant: 32),
      likesButton.heightAnchor.constraint(equalToConstant: 30),
      
      commentsButton.topAnchor.constraint(equalTo: postPhotoImageView.bottomAnchor, constant: 5),
      commentsButton.leadingAnchor.constraint(equalTo: likesButton.trailingAnchor, constant: 15),
      commentsButton.widthAnchor.constraint(equalToConstant: 30),
      commentsButton.heightAnchor.constraint(equalToConstant: 30),
      
      shareButton.topAnchor.constraint(equalTo: postPhotoImageView.bottomAnchor, constant: 5),
      shareButton.leadingAnchor.constraint(equalTo: commentsButton.trailingAnchor, constant: 15),
      shareButton.widthAnchor.constraint(equalToConstant: 30),
      shareButton.heightAnchor.constraint(equalToConstant: 30),
      
      bookmarkButton.topAnchor.constraint(equalTo: postPhotoImageView.bottomAnchor, constant: 10),
      bookmarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
      bookmarkButton.widthAnchor.constraint(equalToConstant: 30),
      bookmarkButton.heightAnchor.constraint(equalToConstant: 23),
      
      likesLabel.topAnchor.constraint(equalTo: likesButton.bottomAnchor, constant: 10),
      likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      likesLabel.widthAnchor.constraint(equalToConstant: 100),
      likesLabel.heightAnchor.constraint(equalToConstant: 20),
      
      nicknameBottomLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 10),
      nicknameBottomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      nicknameBottomLabel.widthAnchor.constraint(equalToConstant: 110),
      nicknameBottomLabel.heightAnchor.constraint(equalToConstant: 15),
      
      signedLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 10),
      signedLabel.leadingAnchor.constraint(equalTo: nicknameBottomLabel.trailingAnchor, constant: 1),
      signedLabel.widthAnchor.constraint(equalToConstant: 200),
      signedLabel.heightAnchor.constraint(equalToConstant: 15),
      
      seeCommentButton.topAnchor.constraint(equalTo: signedLabel.bottomAnchor, constant: 15),
      seeCommentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -3),
      seeCommentButton.widthAnchor.constraint(equalToConstant: 150),
      seeCommentButton.heightAnchor.constraint(equalToConstant: 15),
      
      
      avatarBottomImageView.topAnchor.constraint(equalTo: seeCommentButton.bottomAnchor, constant: 10),
      avatarBottomImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
      avatarBottomImageView.widthAnchor.constraint(equalToConstant: 27),
      avatarBottomImageView.heightAnchor.constraint(equalToConstant: 27),
      
      
      addCommentTextField.topAnchor.constraint(equalTo: seeCommentButton.bottomAnchor, constant: 15),
      addCommentTextField.leadingAnchor.constraint(equalTo: avatarBottomImageView.trailingAnchor, constant: 10),
      addCommentTextField.widthAnchor.constraint(equalToConstant: 150),
      addCommentTextField.heightAnchor.constraint(equalToConstant: 15),
      
      emojiFastReactionButton.topAnchor.constraint(equalTo: seeCommentButton.bottomAnchor, constant: 10),
      emojiFastReactionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1),
      emojiFastReactionButton.widthAnchor.constraint(equalToConstant: 90),
      emojiFastReactionButton.heightAnchor.constraint(equalToConstant: 15),
      
      timeBackLabel.topAnchor.constraint(equalTo: avatarBottomImageView.bottomAnchor, constant: 10),
      timeBackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      timeBackLabel.widthAnchor.constraint(equalToConstant: 120),
      timeBackLabel.heightAnchor.constraint(equalToConstant: 16)
    ])
  }
  
  // MARK: - Setup UI
  private func setUI() {
    backgroundColor = .black
    selectionStyle = .none
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 80, weight: .semibold, scale: .large)
           
    likesButton.setImage(UIImage(systemName: "heart", withConfiguration: largeConfig), for: .normal)
    commentsButton.setImage(UIImage(systemName: "bubble.right", withConfiguration: largeConfig), for: .normal)
    shareButton.setImage(UIImage(systemName: "paperplane", withConfiguration: largeConfig), for: .normal)
    bookmarkButton.setImage(UIImage(systemName: "bookmark", withConfiguration: largeConfig), for: .normal)
    
    [likesButton, commentsButton, shareButton, bookmarkButton].forEach {
      $0.tintColor = .white
    }

    emojiFastReactionButton.setTitle("❤️  🙌  ⊕", for: .normal)
    
    addCommentTextField.attributedPlaceholder =
    NSAttributedString(string: "Add a comment...",
                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
  }
  
  
  
  
  // MARK: - Configure Post
  func configure(post: Post) {
    avatarTopImageView.image = post.avatarImage.withRoundedCorners()
    nicknameTopLabel.text = post.nickname
    postPhotoImageView.image = post.postImage
    likesLabel.text = "Likes: \(post.likes)"
    nicknameBottomLabel.text = post.nickname
    signedLabel.text = post.signed
    avatarBottomImageView.image = post.avatarImage.withRoundedCorners()
    

  }
  
  
}
