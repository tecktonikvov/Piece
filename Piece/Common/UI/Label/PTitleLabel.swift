//  Created by Mac on 16.08.2021.
//

import UIKit

final class PTitleLabel: UILabel {
    init(textColot: UIColor? = R.color.gray_base(), fontSize: CGFloat = 12, text: String) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColot
        self.font = .systemFont(ofSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
