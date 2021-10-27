//  Created by Mac on 25.08.2021.
//

import UIKit

extension UIView {
    func addGradient(colors: [UIColor] = [R.color.blue_gradient_darker() ?? UIColor(), R.color.blue_gradient_lighter() ?? UIColor()],
                     locations: [NSNumber] = [0, 2],
                     startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
                     endPoint: CGPoint = CGPoint(x: 0.0, y: 1.0),
                     type: CAGradientLayerType = .axial){
        
        let gradient = CAGradientLayer()
        
        gradient.frame.size = self.frame.size
        gradient.frame.origin = CGPoint(x: 0.0, y: 0.0)

        gradient.colors = colors.map { $0.cgColor }
        
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint

        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func setShadow() {
        self.layer.shadowColor = R.color.text_base()?.cgColor
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = true
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
