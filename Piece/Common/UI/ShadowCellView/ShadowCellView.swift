//  Created by Mac on 30.08.2021.
//

import UIKit

final class ShadowCellView: UIView {
    internal let containerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.gray_lighter()
        return view
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        layer.masksToBounds = false
        clipsToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowColor = R.color.gray_base()?.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 8
        backgroundColor = .clear
        configureContainerView()
    }
    
    private func configureContainerView() {
        insertSubview(containerView, at: 0)
        //addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()//.inset(16)
            $0.top.bottom.equalToSuperview()//.inset(8)
        }
    }
    
}
