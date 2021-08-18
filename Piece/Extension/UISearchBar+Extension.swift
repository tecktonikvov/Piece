//  Created by Mac on 18.08.2021.
//

import UIKit

extension UISearchBar {
    public func setTextColor(_ color: UIColor?) {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = color
    }
}
