import UIKit

public enum AnimatedStars {
  
  public enum Animation {
    case risingStars
    case bubbles
  }
  
  public enum ZPosition {
    case behindOtherViews
    case onTopOfOtherViews
  }
  
  public static func animate(animation: Animation, zPosition: ZPosition, viewController: UIViewController) {
    DispatchQueue.main.async {
      switch animation {
      case .risingStars:    risingStars(zPosition: zPosition, viewController: viewController)
      case .bubbles:        bubbles(zPosition: zPosition, viewController: viewController)
      }
    }
  }
  
  private static func risingStars(zPosition: ZPosition, viewController: UIViewController) {
    animate(zPosition: zPosition, view: viewController.view, numberOfImages: 50, imageSizeMinimum: 20, imageSizeMaximum: 50, riseTimeMin: 0.8, riseTimeMax: 3.0,  image: UIImage(systemName: "star.fill"), imageTintColor: .yellow)
  }
  
  private static func bubbles(zPosition: ZPosition, viewController: UIViewController) {
    animate(zPosition: zPosition, view: viewController.view, numberOfImages: 50, imageSizeMinimum: 2, imageSizeMaximum: 10, riseTimeMin: 1.2, riseTimeMax: 4.0,  image: UIImage(systemName: "circle.fill"), imageTintColor: .white, alpha: 0.1)
  }
  
  private static func animate(
    zPosition: ZPosition,
    view: UIView,
    numberOfImages: Int,
    imageSizeMinimum: Int,
    imageSizeMaximum: Int,
    riseTimeMin: Double,
    riseTimeMax: Double,
    image: UIImage?,
    imageTintColor: UIColor,
    alpha: CGFloat = 1.0
  ) {
    
    guard let image = image?.withTintColor(imageTintColor.withAlphaComponent(alpha), renderingMode: .alwaysOriginal) else {
      fatalError("Unable to find the image provided.")
    }
    
    var images = [UIImageView]()
    for _ in 0..<numberOfImages {
      let positionX = Int.random(in: (imageSizeMaximum * -1)...Int(UIScreen.main.bounds.width))
      let starSize = Int.random(in: imageSizeMinimum...imageSizeMaximum)
      let imageView = UIImageView(image: image)
      imageView.frame = CGRect(x: CGFloat(positionX), y: CGFloat(view.bounds.height), width: CGFloat(starSize), height: CGFloat(starSize))
      view.addSubview(imageView)
      if zPosition == .behindOtherViews {
        view.sendSubviewToBack(imageView)
      }
      images.append(imageView)
    }
    
    for image in images {
      let riseTime = Double.random(in: riseTimeMin...riseTimeMax)
      UIView.animate(withDuration: riseTime, delay: 0.0, options: .curveEaseOut, animations: {
        image.frame.origin.y -= view.bounds.height
        let rotationAngle: CGFloat = (.pi * 2 * CGFloat.random(in: -1...1))
        image.transform = image.transform.rotated(by: rotationAngle)
      }, completion: { _ in
        image.removeFromSuperview()
      })
    }
  }
}
