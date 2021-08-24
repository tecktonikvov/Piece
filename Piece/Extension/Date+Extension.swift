//  Created by Mac on 17.08.2021.
//

import Foundation

extension Date {
    public func getFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
