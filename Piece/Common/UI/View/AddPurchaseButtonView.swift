//  Created by Mac on 24.08.2021.
//

import UIKit

final class AddPurchaseButtonView: UIView {
    
    private let addButton = AddPurchaseButton()
    private let separatorView = UnderlineView()
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        configureButton()
        configureSeparatorView()
    }
    
    private func configureButton() {
        addSubview(addButton)
        addButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureSeparatorView() {
        addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }
    
    public func setButtonTarget(_ target: AnyObject, action: Selector) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
