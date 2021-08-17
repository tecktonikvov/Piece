//  Created by Mac on 17.08.2021.
//

import UIKit

final class UnderlineView: UIView {
    
    init(isDark: Bool = false) {
        super.init(frame: .zero)
        backgroundColor = isDark ? R.color.gray_base() : R.color.gray_light()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
