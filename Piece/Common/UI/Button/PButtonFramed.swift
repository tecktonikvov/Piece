//  Created by Mac on 17.08.2021.
//

import UIKit
import SnapKit

final class PButtonFramed: PButton {

    override init(title: String) {
        super.init(title: title)
        setTitleColor(R.color.gray_base(), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        layer.borderWidth = 2
        layer.borderColor = R.color.gray_light()?.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
