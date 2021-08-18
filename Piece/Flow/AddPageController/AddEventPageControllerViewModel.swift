import UIKit

protocol PageControllerChildViewModelsInterface {}

protocol AddEventPageControllerViewModelInterface {
    func getControllers() -> [ChildPageViewControllerInterface]
}

final class AddEventPageControllerViewModel: AddEventPageControllerViewModelInterface {

    private let childControllers: [ChildPageViewControllerInterface]

    init(childControllers: [ChildPageViewControllerInterface]) {
        self.childControllers = childControllers
    }

    public func getControllers() -> [ChildPageViewControllerInterface] {
        childControllers
    }
}
