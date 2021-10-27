//  Created by Mac on 24.08.2021.
//

import Foundation

struct EventModel {
    let id: Int
    let title: String
    let members: [Member]
    let totalPrice: Float
    let date: Date
    var purchases = [PurchaseModel]()
    
    
    public static let mockItem = EventModel(id: 0,
                                            title: "Рыбалка Широкое",
                                            members: [Member(id: "11", name: "Alex", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(id: "11", name: "Valya", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(id: "11", name: "Darine", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(id: "11", name: "Алексей", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(id: "11", name: "Рагнар", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(id: "11", name: "Cergo", avatarUrl: nil, phone: "+39492734677")],
                                            totalPrice: 2354.44,
                                            date: Date(),
                                            purchases: PurchaseModel.mock)
    public static let mock = [EventModel(id: 0,
                                         title: "Рыбалка Широкое",
                                         members: [Member(id: "11", name: "Alex", avatarUrl: nil, phone: "+39492734677")],
                                         totalPrice: 2354.44,
                                         date: Date()),
                              EventModel(id: 0,
                                         title: "Рыбалка Широкое",
                                         members: [Member(id: "11", name: "Alex", avatarUrl: nil, phone: "+39492734677"),
                                                   Member(id: "11", name: "Valya", avatarUrl: nil, phone: "+39492734677")],
                                         totalPrice: 2354.44,
                                         date: Date()),
                              mockItem, mockItem, mockItem, mockItem, mockItem, mockItem]
}
