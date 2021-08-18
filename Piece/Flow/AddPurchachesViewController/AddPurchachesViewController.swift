//  Created by Mac on 16.08.2021.
//

import UIKit
import SnapKit

final class AddPurchachesViewController: UIViewController, ChildPageViewControllerInterface {
    
    
    weak var delegate: AddEventStepsControllDelegate?
    
    private let titleTextFielLabel = PTitleLabel(textColot: R.color.gray_dark(), fontSize: 16, text: "Название")
    private let dateTextFielLabel = PTitleLabel(textColot: R.color.gray_dark(), fontSize: 16, text: "Дата")
    
    private lazy var nextButton: PButton = {
        let button = PButton(title: "Создать")
        button.addTarget(self, action: #selector(nexButtonDidPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var previousButton: PButtonFramed = {
        let button = PButtonFramed(title: "Назад")
        button.setBackgroundColor(.clear)
        button.addTarget(self, action: #selector(previousButtonDidPressed), for: .touchUpInside)
        return button
    }()
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(previousButton)
        stackView.addArrangedSubview(nextButton)
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private let titleTextField = PTextFieldView()
    
    private let dateTextField: PTextFieldView = {
        let textField = PTextFieldView()
        textField.setText(Date().formatted)
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale // 24 hour time
        datePicker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        return datePicker
    }()
    
    private let subtitleLabel = PTitleLabel(fontSize: 14, text: "Введите название вашего мероприятия и выбрите дату, или оставьте текущуюю")
    
    private let dateImageView = UIImageView(image: R.image.calendar_icon())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        configuteTitleTextFieldLabel()
        configureTitleTextField()
        configuteDateTextFieldLabel()
        configureDatePicker()
        configureDateTextField()
        configureDateImageView()
        configureSubtitleLabel()
        configureStackview()
    }
    
    private func configuteTitleTextFieldLabel() {
        view.addSubview(titleTextFielLabel)
        titleTextFielLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(32)
        }
    }
    
    private func configureTitleTextField() {
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextFielLabel.snp.bottom).inset(-24)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func configuteDateTextFieldLabel() {
        view.addSubview(dateTextFielLabel)
        dateTextFielLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).inset(-32)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func configureDateTextField() {
        view.addSubview(dateTextField)
        dateTextField.snp.makeConstraints {
            $0.top.equalTo(dateTextFielLabel.snp.bottom).inset(-24)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func configureDatePicker() {
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints {
            $0.top.equalTo(dateTextFielLabel.snp.bottom).inset(-24)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func configureDateImageView() {
        view.addSubview(dateImageView)
        dateImageView.snp.makeConstraints {
            $0.height.width.equalTo(32)
            $0.trailing.equalToSuperview().inset(48)
            $0.centerY.equalTo(dateTextField.snp.top).inset(10)
        }
    }
    
    private func configureSubtitleLabel() {
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).inset(-24)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func configureStackview() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(44)
        }
    }
    

    @objc private func handleDatePicker(_ datePicker: UIDatePicker) {
        dateTextField.setText(datePicker.date.formatted)
    }
    
    @objc private func nexButtonDidPressed() {
        delegate?.nextButtonDidPressed()
    }
    
    @objc private func previousButtonDidPressed() {
        delegate?.previousButtonDidPressd()
    }
}