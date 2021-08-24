//  Created by Mac on 24.08.2021.
//

import UIKit

final class AddPurchaseButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        setImage(R.image.add_icon(), for: .normal)
        contentHorizontalAlignment = .left
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 58, bottom: 0, right: 0)
        setTitle(NSLocalizedString("Добавить", comment: ""), for: .normal)
        setTitleColor(R.color.green_base(), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2) {
                    self.backgroundColor = R.color.gray_base()?.withAlphaComponent(0.6)
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = R.color.white()
                }
            }
        }
    }
    
}
