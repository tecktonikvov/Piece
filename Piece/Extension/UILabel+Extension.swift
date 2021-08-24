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
    
    public func setAttributedText(boldString: String, normalString: String, boldFont: UIFont) {
        let attrs = [NSAttributedString.Key.font: boldFont]
        let attributedString = NSMutableAttributedString(string: boldString, attributes: attrs)
        let normalString = NSMutableAttributedString(string: normalString)
        attributedString.append(normalString)
        self.attributedText = attributedString
    }
}
