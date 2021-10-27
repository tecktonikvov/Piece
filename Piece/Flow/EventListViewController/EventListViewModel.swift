//  Created by Mac on 24.08.2021.
//

import UIKit

typealias EventListViewModelAdapter = BaseViewModelInterface & TableViewAdapter

protocol EventListViewModelIntarface: EventListViewModelAdapter {
    var pushDetailBlock: ((EventModel) -> Void)? { get set }
}

final class EventListViewModel: NSObject, EventListViewModelIntarface {
    public var pushDetailBlock: ((EventModel) -> Void)?
    
    private let model = EventModel.mock
}

// MARK: - TableViewAdapter
extension EventListViewModel  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = model[indexPath.row]
        let cell = EventCell()
        let membersArrayString = currentModel.members.map { $0.name }
        let membersString = membersArrayString.joined(separator: ", ")
        
//        cell.setupCell(title: currentModel.title,
//                       date: currentModel.date,
//                       membersCount: currentModel.members.count,
//                       members: membersString,
//                       price: currentModel.totalPrice)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedEvent = model[indexPath.row]
        pushDetailBlock?(selectedEvent)
    }
    
}

// MARK: - BaseViewModelInterface
extension EventListViewModel {
    func getHeaderSubtitle() -> String {
        "В этом месяце"
    }
    
    func getHeaderAmount() -> Float {
        12212
    }
    
}
