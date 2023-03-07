//
//  UIImage+.swift
//  Insagram
//
//  Created by Kirill Dev on 02.03.2023.
//

import UIKit

extension UIImage {
  
  // MARK: - Change corners UIImage
  public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
    let maxRadius = min(size.width, size.height) / 2
    let cornerRadius: CGFloat
    if let radius = radius, radius > 0 && radius <= maxRadius {
      cornerRadius = radius
    } else {
      cornerRadius = maxRadius
    }
    
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    let rect = CGRect(origin: .zero, size: size)
    UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
    draw(in: rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
}

// MARK: - Get average color UIImage
extension UIImage {
  
  var getAverageColor: UIColor? {
    guard let inputImage = CIImage(image: self) else { return nil }
    
    let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
    
    guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
    guard let outputImage = filter.outputImage else { return nil }
    
    var bitmap = [UInt8](repeating: 0, count: 4)
    let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
    context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
    
    return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
  }
}

// MARK: - Change size the UIImage
extension UIImage {
  func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
    
    let widthRatio = targetSize.width / size.width
    let heightRatio = targetSize.height / size.height
    
    let scaleFactor = min(widthRatio, heightRatio)
    
    let scaledImageSize = CGSize(
      width: size.width * scaleFactor,
      height: size.height * scaleFactor
    )
    
    let renderer = UIGraphicsImageRenderer(
      size: scaledImageSize
    )
    
    let scaledImage = renderer.image { _ in
      self.draw(in: CGRect(
        origin: .zero,
        size: scaledImageSize
      ))
    }
    
    return scaledImage
  }
}

// MARK: - Add special border UIImage
extension UIImage {
  func imageByAddingBorder(width: CGFloat, color: UIColor) -> UIImage? {
    UIGraphicsBeginImageContext(self.size)
    let imageRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
    self.draw(in: imageRect)
    
    let context = UIGraphicsGetCurrentContext()
    let borderRect = imageRect.insetBy(dx: width / 2, dy: width / 2)
    
    context?.setStrokeColor(color.cgColor)
    context?.setLineWidth(width)
    context?.stroke(borderRect)
    
    let borderedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return borderedImage
  }
}
