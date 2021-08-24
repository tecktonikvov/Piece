//  Created by Mac on 24.08.2021.
//

import UIKit

extension UIViewController {
    func showErrorAlert(withMessage message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okButton)
            self.present(alertController, animated: true)
        }
    }
  
    func configureMoveKeyboard(_ observer: Any, showSelector: Selector?, hideSelector: Selector?) {
        if let showSelector = showSelector {
            NotificationCenter.default.addObserver(observer,
                                                   selector: showSelector,
                                                   name: UIResponder.keyboardWillShowNotification, object: nil)
        }
        if let hideSelector = hideSelector {
            NotificationCenter.default.addObserver(observer,
                                                   selector: hideSelector,
                                                   name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
}

