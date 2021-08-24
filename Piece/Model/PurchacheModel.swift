//  Created by Mac on 21.08.2021.
//

import Foundation

struct Purchase {
    let id: Int
    let title: String
    let price: Float
    
    public static let mock = [Purchase(id: 0, title: "Шашель 2кг", price: 232.99),
                              Purchase(id: 1, title: "Водка 3л", price: 450.00),
                              Purchase(id: 2, title: "Овощи", price: 147.87)]
}
