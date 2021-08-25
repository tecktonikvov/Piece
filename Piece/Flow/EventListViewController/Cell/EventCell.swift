//  Created by Mac on 18.08.2021.
//

import UIKit

final class EventCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.gray_lighter()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = R.color.text_base()
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = R.color.text_base()
        return label
    }()
    
    private let memberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = R.color.text_base()
        return label
    }()
    
    private let memberCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = R.color.text_base()
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = R.color.text_base()
        return label
    }()
    
    private let separatorView = UnderlineView()

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
        configureTitleLabel()
        configureDateLabel()
        configureSeparatorView()
        configureMemberCountLabel()
        configureMemberLabel()
        configurePriceLabel()
    }
    
    private func configureContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(100)
        }
    }
    
    private func configureDateLabel() {
        containerView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func configureSeparatorView() {
        containerView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func configureMemberCountLabel() {
        containerView.addSubview(memberCountLabel)
        memberCountLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).inset(-8)
            $0.leading.equalToSuperview().inset(16)
        }
    }
    
    private func configureMemberLabel() {
        let width = UIScreen.main.bounds.width * 0.6
        containerView.addSubview(memberLabel)
        memberLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).inset(-8)
            $0.width.equalTo(width)
            $0.leading.equalTo(memberCountLabel.snp.trailing).inset(-6)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func configurePriceLabel() {
        containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).inset(-8)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    public func setupCell(title: String, date: Date, membersCount: Int, members: String, price: Float) {
        titleLabel.text = title
        dateLabel.text = date.getFormat("dd MMM yyyy")
        memberCountLabel.text = "\(membersCount)"
        memberLabel.text = membersCountUniversal(count: UInt(membersCount)) + ": " + members
        priceLabel.text = "\(price) ₴"
    }
    
    private func membersCountUniversal(count: UInt) -> String {
            let formatString: String = NSLocalizedString("members count", comment: "")
            let resultString: String = String.localizedStringWithFormat(formatString, count)
            return resultString
    }
}
