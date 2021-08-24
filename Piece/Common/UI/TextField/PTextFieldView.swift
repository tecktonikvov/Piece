//  Created by Mac on 17.08.2021.
//

import UIKit
import SnapKit

final class PTextFieldView: UIView {
    private let underlineView = UnderlineView()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = R.color.text_base()
        return textField
    }()
    
    init(placeholder: String = "") {
        super.init(frame: .zero)
        textField.placeholder = placeholder
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        backgroundColor = R.color.white()
        configureTextField()
        configureUnderlineView()
    }
    
    private func configureTextField() {
        addSubview(textField)
        textField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
        }
    }
    
    private func configureUnderlineView() {
        addSubview(underlineView)
        underlineView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).inset(-16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    public func setText(_ text: String) {
        textField.text = text
    }
    
    public func setDelegate(_ delegate: UITextFieldDelegate) {
        textField.delegate = delegate
    }
}
