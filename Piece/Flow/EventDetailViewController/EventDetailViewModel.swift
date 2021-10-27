//  Created by Mac on 29.08.2021.
//

import Foundation


protocol EventDetailViewModelIntarface: BaseViewModelInterface {}

final class EventDetailViewModel: NSObject, EventDetailViewModelIntarface {
    private let model: EventModel
    
    init(event: EventModel) {
        self.model = event
    }
}

// MARK: - BaseViewModelInterface
extension EventDetailViewModel {
    func getHeaderSubtitle() -> String {
        model.title
    }
    
    func getHeaderAmount() -> Float {
        model.totalPrice
    }
    
}
