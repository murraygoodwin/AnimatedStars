import UIKit

public enum AnimatedStars {
  
  public enum Animation {
    case risingStars
    case bubbles
  }
  
  public static func animate(animation: Animation, viewController: UIViewController) {
    switch animation {
      case .risingStars:    risingStars(viewController: viewController)
      case .bubbles:        bubbles(viewController: viewController)
    }
  }
  
  private static func risingStars(viewController: UIViewController) {
    animate(viewController: viewController, numberOfImages: 50, imageSizeMinimum: 20, imageSizeMaximum: 50, riseTimeMin: 0.8, riseTimeMax: 3.0,  image: UIImage(systemName: "star.fill"), imageTintColor: .yellow)
  }
  
  private static func bubbles(viewController: UIViewController) {
    animate(viewController: viewController, numberOfImages: 25, imageSizeMinimum: 8, imageSizeMaximum: 35, riseTimeMin: 0.8, riseTimeMax: 3.0,  image: UIImage(systemName: "circle.fill"), imageTintColor: .yellow)
  }
  
  private static func animate(viewController: UIViewController, numberOfImages: Int, imageSizeMinimum: Int, imageSizeMaximum: Int, riseTimeMin: Double, riseTimeMax: Double, image: UIImage?, imageTintColor: UIColor) {
    guard let image = image?.withTintColor(imageTintColor, renderingMode: .alwaysOriginal) else {
      fatalError("Unable to find the image provided.")
    }
    
    var images = [UIImageView]()
    
    for _ in 0..<numberOfImages {
      let positionX = Int.random(in: (imageSizeMaximum * -1)...Int(UIScreen.main.bounds.width))
      let starSize = Int.random(in: imageSizeMinimum...imageSizeMaximum)
      let imageView = UIImageView(image: image)
      
      imageView.frame = CGRect(
        x: CGFloat(positionX),
        y: CGFloat(viewController.view.bounds.height),
        width: CGFloat(starSize),
        height: CGFloat(starSize)
      )
      viewController.view.addSubview(imageView)
      images.append(imageView)
    }
    
    for image in images {
      let riseTime = Double.random(in: riseTimeMin...riseTimeMax)
      UIView.animate(withDuration: riseTime, delay: 0.0, options: .curveEaseOut, animations: {
        image.frame.origin.y -= viewController.view.bounds.height
        let rotationAngle: CGFloat = (.pi * 2 * CGFloat.random(in: -1...1))
        image.transform = image.transform.rotated(by: rotationAngle)
      }, completion: { _ in
        image.removeFromSuperview()
      })
    }
  }
}
