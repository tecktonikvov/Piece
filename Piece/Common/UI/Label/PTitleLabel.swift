//  Created by Mac on 16.08.2021.
//

import UIKit

final class PTitleLabel: UILabel {
    init(textColot: UIColor? = R.color.gray_base(), fontSize: CGFloat = 14, text: String) {
        super.init(frame: .zero)
        self.setAttributedText(withLineSpacing: 7, text: text)
        self.textColor = textColot
        self.font = .systemFont(ofSize: fontSize)
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
