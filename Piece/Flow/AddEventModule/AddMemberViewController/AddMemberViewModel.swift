//  Created by Mac on 18.08.2021.
//

import UIKit


protocol AddMemberViewModelIntarface: TableViewAdapter {
    func search(_ text: String)
}

final class AddMemberViewModel: NSObject, AddMemberViewModelIntarface {
    private var model = Member.mock
    private var initialModel = Member.mock
    
    private var selectedIndexes = [Int]()
    
    public func search(_ text: String) {
        let lowercaseText = text.lowercased()
        model = text == "" ? initialModel : initialModel.filter { $0.name.lowercased().contains(lowercaseText) }
    }
}
 
extension AddMemberViewModel  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = model[indexPath.row]
        let cell = MemberFullCell()
        cell.setupCell(name: currentModel.name, phone: currentModel.phone, imageUrl: currentModel.avatarUrl)
        
        if indexPath.row == model.count - 1 {
            cell.hideSeparator()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MemberFullCell else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        cell.select()
        if cell.getIsCellSelected() {
            selectedIndexes.append(indexPath.row)
        } else {
            selectedIndexes.removeAll(where: { $0 == indexPath.row })
        }
    }
    
}
 
