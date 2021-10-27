//  Created by Mac on 30.08.2021.
//

import UIKit

extension UITableView {
    func fixCellBounds() {
        DispatchQueue.main.async { [weak self] in
            for cell in self?.visibleCells ?? [] {
                cell.layer.masksToBounds = false
                cell.contentView.layer.masksToBounds = false
            }
        }
    }
}
