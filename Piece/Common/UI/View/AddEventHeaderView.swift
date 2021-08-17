//  Created by Mac on 16.08.2021.
//

import UIKit

final class AddEventHeaderView: UIView {
    private let baseInfoImageView = UIImageView(image: R.image.add_base_info_icon())
    private let addPurchasesImageView = UIImageView(image: R.image.add_purchases_icon())
    private let addMemberImageView = UIImageView(image: R.image.add_member_icon())
    
    private lazy var imageItems = [baseInfoImageView, addPurchasesImageView, addMemberImageView]
    
    private let progressImageView = UIImageView(image: R.image.progress_mock())
    
    private let baseInfoSubtitleLabel = PTitleLabel(text: "Основная информация")
    private let addMemberImageSubtitleLabel = PTitleLabel(text: "Добавить учасников")
    private let addPurchasesSubtitleLabel = PTitleLabel(text: "Основная добавить покупки")
    
    private lazy var labelItems = [baseInfoSubtitleLabel, addMemberImageSubtitleLabel, addPurchasesSubtitleLabel]

    private var state: AddEventHeaderViewState
     
    init(state: AddEventHeaderViewState) {
        self.state = state
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        configureImgageView()
        configureSubtitleLabel()
        configureProgressView()
    }
    
    private func configureImgageView() {
        addSubview(baseInfoImageView)
        baseInfoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(32)
        }
    }
    
    private func configureSubtitleLabel() {
        addSubview(baseInfoSubtitleLabel)
        baseInfoSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(baseInfoImageView.snp.bottom).inset(-24)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func configureProgressView() {
        addSubview(progressImageView)
        progressImageView.snp.makeConstraints {
            $0.top.equalTo(baseInfoSubtitleLabel.snp.bottom).inset(-16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func hideUI() {
        UIView.animate(withDuration: 1) {
            self.progressImageView.alpha = 0
            self.imageItems.forEach { $0.alpha = 0 }
            self.labelItems.forEach { $0.alpha = 0 }
        }
    }
    
    private func setState(_ state: AddEventHeaderViewState) {
        hideUI()
        UIView.animate(withDuration: 1) {
            switch state {
            case .addBaseInfo:
                self.baseInfoImageView.alpha = 1
                self.baseInfoSubtitleLabel.alpha = 1
            case .addMember:
                self.addMemberImageView.alpha = 1
                self.addMemberImageSubtitleLabel.alpha = 1
            case .addPurchases:
                self.addPurchasesImageView.alpha = 1
                self.addPurchasesSubtitleLabel.alpha = 1
            }
        }
    }
    
    enum AddEventHeaderViewState {
        case addBaseInfo
        case addMember
        case addPurchases
    }
}
