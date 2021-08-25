//  Created by Mac on 24.08.2021.
//

import Foundation

struct EventModel {
    let id: Int
    let title: String
    let members: [Member]
    let totalPrice: Float
    let date: Date
    
    
    public static let mockItem = EventModel(id: 0,
                                            title: "Рыбалка Широкое",
                                            members: [Member(name: "Alex", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(name: "Valya", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(name: "Darine", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(name: "Алексей", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(name: "Рагнар", avatarUrl: nil, phone: "+39492734677"),
                                                      Member(name: "Cergo", avatarUrl: nil, phone: "+39492734677")],
                                            totalPrice: 2354.44,
                                            date: Date())
    public static let mock = [EventModel(id: 0,
                                         title: "Рыбалка Широкое",
                                         members: [Member(name: "Alex", avatarUrl: nil, phone: "+39492734677")],
                                         totalPrice: 2354.44,
                                         date: Date()),
                              EventModel(id: 0,
                                         title: "Рыбалка Широкое",
                                         members: [Member(name: "Alex", avatarUrl: nil, phone: "+39492734677"),
                                                   Member(name: "Valya", avatarUrl: nil, phone: "+39492734677")],
                                         totalPrice: 2354.44,
                                         date: Date()),
                              mockItem, mockItem, mockItem, mockItem, mockItem, mockItem]
}
