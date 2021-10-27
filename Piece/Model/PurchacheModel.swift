//  Created by Mac on 21.08.2021.
//

import Foundation

struct PurchaseModel {
    let id: Int
    let title: String
    let price: Float
    let owner: Member?
    
    public static let mock = [PurchaseModel(id: 0, title: "Шашель 2кг", price: 232.99, owner: Member.mock),
                              PurchaseModel(id: 1, title: "Водка 3л", price: 450.00, owner: Member.mock),
                              PurchaseModel(id: 2, title: "Овощи", price: 147.87, owner: nil)]
}
