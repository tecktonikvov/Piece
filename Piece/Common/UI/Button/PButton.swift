//  Created by Mac on 17.08.2021.
//

import UIKit
import SnapKit

final class PButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        tintColor = R.color.white()
        setTitle(NSLocalizedString(title, comment: ""), for: .normal)
        setTitleColor(R.color.white(), for: .normal)
        layer.cornerRadius = 6
        backgroundColor = R.color.green_base()
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2) {
                    self.backgroundColor = R.color.green_base()?.withAlphaComponent(0.6)
                    self.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.backgroundColor = R.color.green_base()
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
    }
}
