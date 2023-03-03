//
//  RecommendationTableViewCell.swift
//  Insagram
//
//  Created by Kirill Dev on 03.03.2023.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .blue
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
