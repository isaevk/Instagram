//
//  StoriesTableViewCell.swift
//  Insagram
//
//  Created by Kirill Dev on 03.03.2023.
//

import UIKit

final class StoriesTableViewCell: UITableViewCell {

  private let storyButton = UIButton()
  private let storyButton2 = UIButton()
  private let storyButton3 = UIButton()
  
  private let stories = Source.makePost()
  
  private lazy var scrollView: UIScrollView = {
    let sv = UIScrollView()
    sv.showsVerticalScrollIndicator = false
    sv.showsHorizontalScrollIndicator = false
    sv.backgroundColor = .black
    sv.contentSize =  contentSize
    sv.frame = CGRect(x: 0, y: 0, width: 600, height: 90)
    return sv
  }()
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.spacing = 10
    return stackView
  }()
  
  private  lazy var contentUIView: UIView = {
    let cv = UIView()
    cv.backgroundColor = .black
    cv.frame.size = contentSize
    return cv
  }()
  
  private var contentSize: CGSize {
    CGSize(width: contentView.bounds.width + 400, height: 90)
   }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: Setup Constraints
  private func setConstraints() {
    [stackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    [storyButton, storyButton2, storyButton3].forEach {
      stackView.addArrangedSubview($0)
    }
    
    for view in stackView.arrangedSubviews {
      NSLayoutConstraint.activate([
        view.widthAnchor.constraint(equalToConstant: 90),
        view.heightAnchor.constraint(equalToConstant: 70)
      ])
    }
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentUIView.topAnchor),
      stackView.leftAnchor.constraint(equalTo: contentUIView.leftAnchor),
      stackView.rightAnchor.constraint(equalTo: contentUIView.rightAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentUIView.bottomAnchor),
    ])
  }
  
  // MARK: - Setup UI
  private func setUI() {
    contentView.addSubview(scrollView)
    scrollView.addSubview(contentUIView)
    contentUIView.addSubview(stackView)
    
    storyButton.createStoryButton(image: stories[0].avatarImage, nick: stories[0].nickname)
    storyButton2.createStoryButton(image: stories[1].avatarImage, nick: stories[1].nickname)
    storyButton3.createStoryButton(image: stories[2].avatarImage, nick: stories[2].nickname)
  }
}
