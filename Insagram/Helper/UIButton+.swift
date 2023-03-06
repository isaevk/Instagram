//
//  UIButton+.swift
//  Insagram
//
//  Created by Kirill Dev on 02.03.2023.
//

import UIKit

extension UIButton {
  
  func createStoryButton(image: UIImage, nick: String) {
    self.tintColor = .white
    
    let targetSize = CGSize(width: 62, height: 62)
    let scaledImage = image.scalePreservingAspectRatio(
        targetSize: targetSize
    )
    
    var configuration = UIButton.Configuration.plain()

    let color = scaledImage.getAverageColor ?? UIColor.red
    configuration.image = scaledImage.imageByAddingBorder(width: 3.5, color: color)?.withRoundedCorners()
    configuration.subtitle = nick
    configuration.imagePlacement = .top
    configuration.titlePadding = 1
    configuration.imagePadding = 1
    configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    self.configuration = configuration
  }
}
