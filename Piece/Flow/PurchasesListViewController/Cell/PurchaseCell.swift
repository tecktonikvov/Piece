//  Created by Mac on 30.08.2021.
//

import Foundation

import UIKit

final class MemberSelectableView: TappableView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = R.color.text_base()
        return label
    }()
    
    private let avatarImageView = AvatarImageView()
    
    private let separatorView = UnderlineView()

    private lazy var indicatorImage: UIImageView = {
        let imageView = UIImageView(image: R.image.selected_purchahe_icon())
        imageView.isHidden = !isSelected
        return imageView
    }()
    
    private var isSelected = false {
        didSet {
            indicatorImage.isHidden = !isSelected
        }
    }
    
    private let hideSeparator: Bool

    init(name: String, imageUrl: String?, hideSeparator: Bool = false) {
        self.hideSeparator = hideSeparator
        super.init()
        nameLabel.text = name
        avatarImageView.loadImageUsingCacheWithUrlString(urlString: imageUrl ?? "", completion: nil)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        configureImageView()
        configureLabel()
        configureIndicatorImageView()
        guard !hideSeparator else { return }
        configureSeparatorView()
    }

    private func configureImageView() {
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints {
            $0.width.height.equalTo(26)
            $0.leading.equalToSuperview().inset(32)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func configureLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarImageView.snp.trailing).inset(-16)
            $0.trailing.equalToSuperview().inset(48)
            $0.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func configureIndicatorImageView() {
        addSubview(indicatorImage)
        indicatorImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(32)
            $0.centerY.equalToSuperview()
        }
    }
        
    private func configureSeparatorView() {
        addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().inset(-4)
        }
    }
    
    override func tap(sender: UITapGestureRecognizer) {
        super.tap(sender: sender)
        isSelected.toggle()
        print(nameLabel.text)
    }
}

final class PurchaseCell: BaseCell {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textColor = R.color.text_base()
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = R.color.text_base()
        return label
    }()

    private let topSeparatorView = UnderlineView()

    private lazy var ownerView: TappableView = {
        let view = TappableView()
        view.setTarget(self, selector: #selector(ownerViewDidSelected))
        return view
    }()

    private let ownerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = R.color.text_base()
        label.text = "Купил:"
        return label
    }()

    private let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = R.color.text_base()
        return label
    }()

    private let ownerAvatarImageView = AvatarImageView()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(ownerNameLabel)
        stackView.addArrangedSubview(ownerAvatarImageView)
        stackView.spacing = 16
        return stackView
    }()

    private let ownerSeparatorView = UnderlineView()

    private let wrapTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = R.color.gray_base()
        label.text = "Нажмите тут что бы выбрать учасников"
        return label
    }()

    private let wrapArrowImageView = UIImageView(image: R.image.wrap_arrow_icon())

    private lazy var wrapStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(wrapTextLabel)
        stackView.addArrangedSubview(wrapArrowImageView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(unwrapMembersList))
        stackView.addGestureRecognizer(tapRecognizer)
        return stackView
    }()
    
    
    private lazy var membersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.clipsToBounds = true
        return stackView
    }()

    private var isMemberListUnwrapped = false
    
    private var membersStackViewContentHeight: CGFloat = .zero
    private let memberItemHeight: CGFloat = 38

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCell() {
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        selectionStyle = .none
        configureTitleLabel()
        configurePriceLabel()
        configureTopSeparatorView()
        configureOwnerView()
        configureOwnerTitleLabel()
        configureOwnerAvatarImageView()
        configureOwnerStackView()
        configureOwnerSeparatorView()
        configureWrapStackView()
        configureMembersStackView()
    }

    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(100)
        }
    }

    private func configurePriceLabel() {
        containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
        }
    }

    private func configureTopSeparatorView() {
        containerView.addSubview(topSeparatorView)
        topSeparatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }

    private func configureOwnerView() {
        containerView.addSubview(ownerView)
        ownerView.snp.makeConstraints {
            $0.top.equalTo(topSeparatorView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }

    private func configureOwnerTitleLabel() {
       // let width = UIScreen.main.bounds.width * 0.6
        ownerView.addSubview(ownerTitleLabel)
        ownerTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(16)
        }
    }

    private func configureOwnerAvatarImageView() {
        ownerAvatarImageView.snp.makeConstraints {
            $0.width.height.equalTo(32)
        }
    }

    private func configureOwnerStackView() {
        ownerView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
    }

    private func configureOwnerSeparatorView() {
        containerView.addSubview(ownerSeparatorView)
        ownerSeparatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(ownerView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }

    private func configureWrapStackView() {
        containerView.addSubview(wrapStackView)
        wrapStackView.snp.makeConstraints {
            $0.top.equalTo(ownerSeparatorView.snp.bottom).inset(-32)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configureMembersStackView() {
        containerView.addSubview(membersStackView)
        membersStackView.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.top.equalTo(wrapStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
    }

    public func setupCell(purchaseTitle: String, owner: Member?, price: Float, membersList: [Member]) {
        titleLabel.text = purchaseTitle
        priceLabel.text = "\(price) ₴"
        if let owner = owner {
            ownerAvatarImageView.loadImageUsingCacheWithUrlString(urlString: owner.avatarUrl ?? String.imageUrlMock)
            ownerNameLabel.text = owner.name
        } else {
            ownerAvatarImageView.removeFromSuperview()
            ownerNameLabel.text = "Пусто"
        }
        addMembers(membersList)
    }
    
    private func addMembers(_ membersList: [Member]) {
        for i in 0...membersList.count - 1 {
            let member = membersList[i]
            let isLast = i == membersList.count - 1
            let memberView = MemberSelectableView(name: member.name, imageUrl: member.avatarUrl, hideSeparator: isLast)
            membersStackView.addArrangedSubview(memberView)
            membersStackViewContentHeight += memberItemHeight
        }
        //membersStackView.layoutIfNeeded()
    }

    @objc private func ownerViewDidSelected() {
        print("ownerViewDidSelected")
    }

    @objc private func unwrapMembersList() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) { [weak self] in
            guard let self = self else { return }
            
            let value = self.isMemberListUnwrapped ? 0 : self.membersStackViewContentHeight
            self.membersStackView.snp.updateConstraints {
                $0.height.equalTo(value)
            }

            self.layoutIfNeeded()
            if let tableView = self.superview as? UITableView {
                tableView.beginUpdates()
                tableView.endUpdates()
                tableView.fixCellBounds()
            }
            self.isMemberListUnwrapped.toggle()

            let angle: CGFloat = self.isMemberListUnwrapped ? .pi : 0
            self.wrapArrowImageView.transform = CGAffineTransform(rotationAngle: angle)
        }
    }

    private func membersCountUniversal(count: UInt) -> String {
        let formatString: String = NSLocalizedString("members count", comment: "")
        let resultString: String = String.localizedStringWithFormat(formatString, count)
        return resultString
    }
    
   // public func userSlected
}
