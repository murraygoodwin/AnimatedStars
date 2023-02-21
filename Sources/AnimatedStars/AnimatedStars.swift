import UIKit

public extension UIViewController {
  
  enum Animation {
    case risingStars
    case bubbles
  }
  
  enum ZPosition {
    case behindOtherViews
    case onTopOfOtherViews
  }
  
  func animate(_ animation: Animation, zPosition: ZPosition) {
    switch animation {
    case .risingStars:    risingStars(zPosition: zPosition)
    case .bubbles:        bubbles(zPosition: zPosition)
    }
  }
  
  private func risingStars(zPosition: ZPosition) {
    animate(zPosition: zPosition, numberOfImages: 50, imageSizeMinimum: 20, imageSizeMaximum: 50, riseTimeMin: 0.8, riseTimeMax: 3.0,  image: UIImage(systemName: "star.fill"), imageTintColor: .yellow)
  }
  
  private func bubbles(zPosition: ZPosition) {
    animate(zPosition: zPosition, numberOfImages: 50, imageSizeMinimum: 2, imageSizeMaximum: 10, riseTimeMin: 1.2, riseTimeMax: 4.0,  image: UIImage(systemName: "circle.fill"), imageTintColor: .white, alpha: 0.1)
  }
  
  private func animate(
    zPosition: ZPosition,
    numberOfImages: Int,
    imageSizeMinimum: Int,
    imageSizeMaximum: Int,
    riseTimeMin: Double,
    riseTimeMax: Double,
    image: UIImage?,
    imageTintColor: UIColor,
    alpha: CGFloat = 1.0
  ) {
    
    DispatchQueue.main.async { [weak self] in
      guard let image = image?.withTintColor(imageTintColor.withAlphaComponent(alpha), renderingMode: .alwaysOriginal) else {
        fatalError("Unable to find the image provided.")
      }
      guard let self else { return }
      
      var images = [UIImageView]()
      for _ in 0..<numberOfImages {
        let positionX = Int.random(in: (imageSizeMaximum * -1)...Int(UIScreen.main.bounds.width))
        let imageSize = Int.random(in: imageSizeMinimum...imageSizeMaximum)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: CGFloat(positionX), y: CGFloat(self.view.bounds.height), width: CGFloat(imageSize), height: CGFloat(imageSize))
        self.view.addSubview(imageView)
        if zPosition == .behindOtherViews {
          self.view.sendSubviewToBack(imageView)
        }
        images.append(imageView)
      }
      
      images.forEach { image in
        let riseTime = Double.random(in: riseTimeMin...riseTimeMax)
        UIView.animate(withDuration: riseTime, delay: 0.0, options: .curveEaseOut, animations: {
          image.frame.origin.y -= self.view.bounds.height
          let rotationAngle: CGFloat = (.pi * 2 * CGFloat.random(in: -1...1))
          image.transform = image.transform.rotated(by: rotationAngle)
        }, completion: { _ in
          image.removeFromSuperview()
        })
      }
    }
  }
}
