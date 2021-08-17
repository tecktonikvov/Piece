//  Created by Mac on 17.08.2021.
//

import Foundation

extension Date {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm"
        return formatter
    }()
    var formatted: String {
        return Date.formatter.string(from: self)
    }
}
