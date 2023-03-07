//
//  RecommendationTableViewCell.swift
//  Insagram
//
//  Created by Kirill Dev on 03.03.2023.
//

import UIKit

final class RecommendationTableViewCell: UITableViewCell {
  
  // MARK: - Private Properties
  private var posts = Source.makePost()
  
  private let recomendationOneView = RecommendationView()
  private let recomendationTwoView = RecommendationView()
  private let recomendationThreeView = RecommendationView()
  
  private let recomendationLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 16)
    label.text = "Recommended for you"
    label.textColor = .white
    return label
  }()
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.backgroundColor = .separator
    stackView.layer.cornerRadius = 30
    stackView.spacing = 10
    return stackView
  }()
  
  private var contentSize: CGSize {
    CGSize(width: contentView.bounds.width + 500, height: 260)
   }
  
  // MARK: - Lazy Properties
  private lazy var scrollView: UIScrollView = {
    let sv = UIScrollView()
    sv.showsVerticalScrollIndicator = false
    sv.showsHorizontalScrollIndicator = false
    sv.backgroundColor = .separator
    sv.contentSize =  contentSize
    sv.frame = CGRect(x: 0, y: 20, width: 580, height: 280)
    return sv
  }()
  
  private  lazy var contentUIView: UIView = {
    let cv = UIView()
    cv.backgroundColor = .tintColor
    cv.frame = CGRect(x: 0, y: 30, width: 680, height: 250)
    return cv
  }()
  
  // MARK: - Override Initializers
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
    [recomendationLabel, stackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    contentView.addSubview(recomendationLabel)
    
    NSLayoutConstraint.activate([
      recomendationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      recomendationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
    ])
    
    [recomendationOneView, recomendationTwoView, recomendationThreeView].forEach {
      stackView.addArrangedSubview($0)
    }
    
    for view in stackView.arrangedSubviews {
      view.backgroundColor = .black
      view.layer.cornerRadius = 30.0
      NSLayoutConstraint.activate([
        view.widthAnchor.constraint(equalToConstant: 220),
        view.heightAnchor.constraint(equalToConstant: 250)
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
    selectionStyle = .none
    backgroundColor = .separator

    contentView.addSubview(scrollView)
    scrollView.addSubview(contentUIView)
    contentUIView.addSubview(stackView)
    
    recomendationOneView.configure(post: posts[0])
    recomendationTwoView.configure(post: posts[1])
    recomendationThreeView.configure(post: posts[2])
  }
}
