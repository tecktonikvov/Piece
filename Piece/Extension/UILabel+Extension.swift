//  Copyright © 2021 Olympic. All rights reserved.
//

import UIKit

extension UILabel {
    public func setAttributedText(withLineSpacing lineSpasing: Double, text: String) {
        let attrString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineSpasing)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        self.attributedText = attrString
    }
    
    func shadow() {
        self.layer.shadowColor = R.color.text_base()?.cgColor
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = true
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
