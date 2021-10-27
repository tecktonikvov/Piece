//  Created by Mac on 18.08.2021.
//

import UIKit

final class AddPurchaseCell: UITableViewCell {
    
    private let titleLabel = PTitleLabel(textColor: R.color.gray_base(), fontSize: 14)
    private let priceLabel = PTitleLabel(textColor: R.color.gray_base(), fontSize: 14)
    private let separatorView = UnderlineView()
    private let selectedIcon = UIImageView(image: R.image.selected_purchahe_icon())
    
    private var isCellSelected = false {
        didSet {
            titleLabel.textColor = isCellSelected ? R.color.text_base() : R.color.gray_base()
            priceLabel.textColor = isCellSelected ? R.color.text_base() : R.color.gray_base()
            selectedIcon.isHidden = !isCellSelected
        }
    }
    
    private var id = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        configureSelectedIcon()
        configurePriceLabel()
        configureTitleLabel()
        configureSeparatorView()
    }
    
    private func configureSelectedIcon() {
        contentView.addSubview(selectedIcon)
        selectedIcon.isHidden = true
        selectedIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(32)
        }
    }
    
    private func configurePriceLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(32)
            $0.top.equalToSuperview().inset(12)
        }
    }
    
    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(selectedIcon.snp.trailing).inset(-8)
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalTo(priceLabel.snp.leading).inset(24)
        }
    }
        
    private func configureSeparatorView() {
        contentView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo((titleLabel).snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview()
        }
    }
    
    public func setupCell(title: String, price: Float, id: Int) {
        titleLabel.text = title
        priceLabel.text = "\(price) ₴"
        self.id = id
    }
    
    public func select() {
        isCellSelected.toggle()
    }
    
    public func getIsCellSelected() -> Bool {
        isCellSelected
    }
    
    public func getId() -> Int {
        id
    }
    
    public func hideSeparator() {
        separatorView.isHidden = true
    }
    
}
