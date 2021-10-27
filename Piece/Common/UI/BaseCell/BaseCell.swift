//  Created by Mac on 30.08.2021.
//

import UIKit

class BaseCell: UITableViewCell {
    internal let containerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.gray_lighter()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.layer.masksToBounds = false
        contentView.clipsToBounds = false
        contentView.layer.shadowOffset = CGSize(width: 0, height: 10)
        contentView.layer.shadowColor = R.color.gray_base()?.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 8
        backgroundColor = .clear
        configureContainerView()
    }
    
    private func configureContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(8)
        }
    }
    
}
