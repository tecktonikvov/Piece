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
}
