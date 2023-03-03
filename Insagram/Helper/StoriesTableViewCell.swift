//
//  StoriesTableViewCell.swift
//  Insagram
//
//  Created by Kirill Dev on 03.03.2023.
//

import UIKit

final class StoriesTableViewCell: UITableViewCell {

  private let scrollView: UIScrollView = {
    let sv = UIScrollView()
    sv.showsVerticalScrollIndicator = false
    sv.showsHorizontalScrollIndicator = false
    sv.isScrollEnabled = false
    return sv
  }()
  private let storiesButton = UIButton()
  private let nicknameLabel = UILabel()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setConstraints() {
    
  }
  
  private func setUI() {
    backgroundColor = .white
  }
  
  func configuration(post: Post) {
    storiesButton.setImage(post.avatarImage, for: .normal)
    nicknameLabel.text = post.nickname
  }
}
