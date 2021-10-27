//  Created by Mac on 18.08.2021.
//

import UIKit

final class MemberFullCell: UITableViewCell {
    
    private let nameLabel = PTitleLabel(textColor: R.color.text_base(), fontSize: 18)
    private let phoneLabel = PTitleLabel(textColor: R.color.gray_base(), fontSize: 14)
    private let separatorView = UnderlineView()
    private let selectedIcon = UIImageView(image: R.image.selected_icon())
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private let avatarImageView = AvatarImageView()
    
    private var isCellSelected = false {
        didSet {
            selectedIcon.isHidden = !isCellSelected
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        configureStackView()
        configureAvatarImageView()
        configureSelectedIcon()
        configureSeparatorView()
    }
    
    private func configureStackView() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(88)
            $0.trailing.equalToSuperview().inset(80)
        }
    }
    
    private func configureAvatarImageView() {
        contentView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(32)
            $0.centerY.equalTo(stackView)
            $0.width.height.equalTo(40)
        }
    }
    
    private func configureSelectedIcon() {
        contentView.addSubview(selectedIcon)
        selectedIcon.isHidden = true
        selectedIcon.snp.makeConstraints {
            $0.centerY.equalTo(stackView)
            $0.trailing.equalToSuperview().inset(32)
        }
    }
        
    private func configureSeparatorView() {
        contentView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo((stackView).snp.bottom).inset(-16)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview()
        }
    }
    
    public func setupCell(name: String, phone: String, imageUrl: String?) {
        nameLabel.text = name
        phoneLabel.text = phone
        let imageUrl: String = imageUrl ?? String.imageUrlMock
        avatarImageView.loadImageUsingCacheWithUrlString(urlString: imageUrl)
    }
    
    public func select() {
        isCellSelected.toggle()
    }
    
    public func getIsCellSelected() -> Bool {
        isCellSelected
    }
    
    public func hideSeparator() {
        separatorView.isHidden = true
    }
}
