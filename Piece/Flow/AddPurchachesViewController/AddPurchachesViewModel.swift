//  Created by Mac on 18.08.2021.
//

import UIKit


protocol AddPurchachesViewModelIntarface: TableViewAdapter {
}

final class AddPurchachesViewModel: NSObject, AddPurchachesViewModelIntarface {
    private var model = Member.mock
    
    private var selectedIndexes = [Int]()
    
}
 
extension AddPurchachesViewModel  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = model[indexPath.row]
        let cell = MemberFullCell()
        cell.setupCell(name: currentModel.name, phone: currentModel.phone, imageUrl: currentModel.avatarUrl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MemberFullCell else { return }
        cell.select()
        if cell.getIsCellSelected() {
            selectedIndexes.append(indexPath.row)
        } else {
            selectedIndexes.removeAll(where: { $0 == indexPath.row })
        }
    }
    
}
 
