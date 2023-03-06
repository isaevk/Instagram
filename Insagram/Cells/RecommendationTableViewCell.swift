//
//  RecommendationTableViewCell.swift
//  Insagram
//
//  Created by Kirill Dev on 03.03.2023.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {
  
  private let recomendationLabel = UILabel()
  
  private let recomendationOneView = UIView()
  private let recomendationTwoView = UIView()
  private let recomendationThreeView = UIView()
  
  private lazy var scrollView: UIScrollView = {
    let sv = UIScrollView()
    sv.showsVerticalScrollIndicator = false
    sv.showsHorizontalScrollIndicator = false
    sv.backgroundColor = .separator
    sv.contentSize =  contentSize
    sv.frame = CGRect(x: 0, y: 20, width: 600, height: 260)
    sv.contentSize =  contentSize
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
    cv.backgroundColor = .green
    cv.frame = CGRect(x: 0, y: 30, width: 700, height: 250)
    return cv
  }()
  
  private var contentSize: CGSize {
    CGSize(width: contentView.bounds.width + 800, height: 260)
   }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .black
    setUI()
    setConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  
  private func setConstraints() {
    [recomendationLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      recomendationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      recomendationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
    ])
    
    [recomendationOneView, recomendationTwoView, recomendationThreeView].forEach {
      stackView.addArrangedSubview($0)
    }
    
    for view in stackView.arrangedSubviews {
      view.backgroundColor = .red
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
  
  private func setUI() {
    recomendationLabel.font = .boldSystemFont(ofSize: 16)
    recomendationLabel.text = "Recommended for you"
    recomendationLabel.textColor = .white
    
    contentView.addSubview(scrollView)
    scrollView.addSubview(contentUIView)
    contentUIView.addSubview(stackView)
    
  }
}
