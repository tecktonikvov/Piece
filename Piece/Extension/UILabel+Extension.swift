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
}
