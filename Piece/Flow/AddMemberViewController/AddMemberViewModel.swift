//  Created by Mac on 18.08.2021.
//

import UIKit


protocol AddMemberViewModelIntarface: TableViewAdapter {
    
}

final class AddMemberViewModel: NSObject, AddMemberViewModelIntarface {
    private let model = Member.mock
}
 
extension AddMemberViewModel  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = model[indexPath.row]
        let cell = MemberFullCell()
        cell.setupCell(name: currentModel.name, phone: currentModel.phone, imageUrl: currentModel.avatarUrl)
        return cell
    }
    
}
 
