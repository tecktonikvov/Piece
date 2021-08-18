//  Created by Mac on 16.08.2021.
//

import UIKit
import StepIndicator

final class AddEventHeaderView: UIView {
    
    private let totalCostLabel: UILabel = {
        let label = UILabel()
        label.text = "₴ 265.43"
        label.textColor = R.color.text_base()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    private lazy var totalCostStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(addPurchasesImageView)
        stackView.addArrangedSubview(totalCostLabel)
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    private let baseInfoImageView = UIImageView(image: R.image.add_base_info_icon())
    private let addMemberImageView = UIImageView(image: R.image.add_member_icon())
    private let addPurchasesImageView = UIImageView(image: R.image.add_purchases_icon())
    private lazy var imageItems = [baseInfoImageView, addMemberImageView, totalCostStackView]
        
    private let baseInfoSubtitleLabel = PTitleLabel(text: "Основная информация")
    private let addMemberImageSubtitleLabel = PTitleLabel(text: "Добавить учасников")
    private let addPurchasesSubtitleLabel = PTitleLabel(text: "Добавить покупки")
    private lazy var labelItems = [baseInfoSubtitleLabel, addMemberImageSubtitleLabel, addPurchasesSubtitleLabel]
    
    private let stepIndicatorView: StepIndicatorView = {
        let view = StepIndicatorView()
        view.circleTintColor = R.color.blue_base() ?? UIColor()
        view.lineTintColor = R.color.blue_base() ?? UIColor()
        view.numberOfSteps = 3
        view.currentStep = 0
        view.circleRadius = 10
        view.lineStrokeWidth = 3
        return view
    }()

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
        configureImgageViews()
        configureSubtitleLabel()
        configureProgressView()
        setState(.addBaseInfo)
    }
    
    private func configureImgageViews() {
        imageItems.forEach {
            addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.centerX.equalToSuperview()
            }
        }
    }
    
    private func configureSubtitleLabel() {
        labelItems.forEach {
            addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(baseInfoImageView.snp.bottom).inset(-24)
                $0.centerX.equalToSuperview()
            }
        }
    }
    
    private func configureProgressView() {
        addSubview(stepIndicatorView)
        stepIndicatorView.snp.makeConstraints {
            $0.top.equalTo(baseInfoSubtitleLabel.snp.bottom).inset(-16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func hideUI() {
        UIView.animate(withDuration: 0.3) {
            self.imageItems.forEach { $0.alpha = 0 }
            self.labelItems.forEach { $0.alpha = 0 }
        }
    }
    
    private func setState(_ state: AddEventHeaderViewState) {
        hideUI()
        UIView.animate(withDuration: 0.3) {
            switch state {
            case .addBaseInfo:
                self.baseInfoImageView.alpha = 1
                self.baseInfoSubtitleLabel.alpha = 1
            case .addMember:
                self.addMemberImageView.alpha = 1
                self.addMemberImageSubtitleLabel.alpha = 1
            case .addPurchases:
                self.totalCostStackView.alpha = 1
                self.addPurchasesSubtitleLabel.alpha = 1
            }
        }
    }
    
    public func setNextStep() {
        stepIndicatorView.currentStep += 1
        let currentStep = stepIndicatorView.currentStep
        if currentStep == 1 {
            setState(.addMember)
        } else {
            setState(.addPurchases)
        }
    }
    
    public func setPreviousStep() {
        stepIndicatorView.currentStep -= 1
        let currentStep = stepIndicatorView.currentStep
        if currentStep == 0 {
            setState(.addBaseInfo)
        } else {
            setState(.addMember)
        }
    }
    
    enum AddEventHeaderViewState {
        case addBaseInfo
        case addMember
        case addPurchases
    }
}
