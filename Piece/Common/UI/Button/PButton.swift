//  Created by Mac on 17.08.2021.
//

import UIKit
import SnapKit

class PButton: UIButton {
    
    private var bgColor = R.color.green_base()

    init(title: String) {
        super.init(frame: .zero)
        setTitle(NSLocalizedString(title, comment: ""), for: .normal)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        setTitleColor(R.color.white(), for: .normal)
        layer.cornerRadius = 6
        backgroundColor = bgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2) {
                    self.backgroundColor = self.bgColor?.withAlphaComponent(0.6)
                    self.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.backgroundColor = self.bgColor
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
    }
    
    public func setBackgroundColor(_ collor: UIColor) {
        backgroundColor = collor
        bgColor = collor
    }
}
