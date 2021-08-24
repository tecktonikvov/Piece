//  Created by Mac on 24.08.2021.
//

import UIKit

protocol EventListViewModelIntarface: TableViewAdapter {
    
}

final class EventListViewModel: NSObject, EventListViewModelIntarface {
    private let model = EventModel.mock
}

extension EventListViewModel  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = model[indexPath.row]
        let cell = EventCell()
        let membersArrayString = currentModel.members.map { $0.name }
        let membersString = membersArrayString.joined(separator: ", ")
        
        cell.setupCell(title: currentModel.title,
                       date: currentModel.date,
                       membersCount: currentModel.members.count,
                       members: membersString,
                       price: currentModel.totalPrice)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // guard let cell = tableView.cellForRow(at: indexPath) as? EventCell else { return }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
