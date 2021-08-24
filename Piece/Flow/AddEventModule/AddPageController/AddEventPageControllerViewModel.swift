import UIKit

protocol PageControllerChildViewModelsInterface {}

protocol AddEventPageControllerViewModelInterface {
    var updatePriceBlock: ((Float) -> Void)? { get set }
    func getControllers() -> [ChildPageViewControllerInterface]
}

final class AddEventPageControllerViewModel: AddEventPageControllerViewModelInterface {
    public var updatePriceBlock: ((Float) -> Void)?

    private let childControllers: [ChildPageViewControllerInterface]
    private let purchaseViewModel: AddPurchaseViewModel

    init(childControllers: [ChildPageViewControllerInterface], purchaseViewModel: AddPurchaseViewModel) {
        self.purchaseViewModel = purchaseViewModel
        self.childControllers = childControllers
        setupCallbacks()
    }
    
    private func setupCallbacks() {
        purchaseViewModel.updatePriceBlock = { [weak self] totalPrice in
            self?.updatePriceBlock?(totalPrice)
        }
    }

    public func getControllers() -> [ChildPageViewControllerInterface] {
        childControllers
    }
}
