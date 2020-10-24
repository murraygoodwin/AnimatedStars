
import Foundation
import UIKit

public struct AnimatedStars {
  
  public init() {}
  
  public var numberOfStars = 50
  public var starSizeMinimum = 20
  public var starSizeMaximum = 50
  public var riseTimeMin = 0.8
  public var riseTimeMax = 3.0
  public var starImage = UIImage(systemName: "star.fill")?.withTintColor(UIColor.yellow, renderingMode: .alwaysOriginal)
  
  public func animateStars(vc: UIViewController) {
    
    var stars = [UIImageView]()
    
    for _ in 1...numberOfStars {
      
      let positionX = Int.random(in: (starSizeMaximum * -1)...Int(UIScreen.main.bounds.width))
      let starSize = Int.random(in: starSizeMinimum...starSizeMaximum)
      let starImageView = UIImageView(image: starImage)
      
      starImageView.frame = CGRect(x: CGFloat(positionX), y: CGFloat(vc.view.bounds.height), width: CGFloat(starSize), height: CGFloat(starSize))
      
      vc.view.addSubview(starImageView)
      stars.append(starImageView)
      
    }
    
    for n in 0..<stars.count {
      
      let riseTime = Double.random(in: riseTimeMin...riseTimeMax)
      
      UIView.animate(withDuration: riseTime,
                     delay: 0.0,
                     options: .curveEaseOut,
                     animations: {
                      
                      stars[n].frame.origin.y -= vc.view.bounds.height
                      
                      let rotationAngle: CGFloat = (.pi * 2 * CGFloat.random(in: -1...1))
                      stars[n].transform = stars[n].transform.rotated(by: rotationAngle)
                      
                     }
                     , completion: { _ in
                      stars[n].removeFromSuperview()
                     })
    }
  }
}
