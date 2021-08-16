import UIKit

protocol PageControllerChildViewModelsInterface {}

protocol AddEventPageControllerViewModelInterface {
    func getControllers() -> [UIViewController]
}

final class AddEventPageControllerViewModel: AddEventPageControllerViewModelInterface {

    private let childControllers: [AddEventActionsDelegate]

    init(childControllers: [AddEventActionsDelegate]) {
        self.childControllers = childControllers
       // childrenViewModels.forEach { $0.delegate = self }
    }

    public func getControllers() -> [UIViewController] {
        childControllers
    }
}
