//  Created by Mac on 18.08.2021.
//

import Foundation

struct Member {
    let id: String
    var name: String
    let avatarUrl: String?
    let phone: String
    
    private static let avatarUrlMock = "https://stonegatesl.com/wp-content/uploads/2021/01/avatar.jpg"
    public static var mockArr = [Member(id: "11", name: "Alex", avatarUrl: avatarUrlMock, phone: "+39492734677"),
                              Member(id: "23", name: "Valya", avatarUrl: avatarUrlMock, phone: "+39492734677"),
                              Member(id: "22", name: "Cergo", avatarUrl: avatarUrlMock, phone: "+39492734677")]
    
    public static var mock = Member(id: "11", name: "Alex", avatarUrl: nil, phone: "+39492734677")
}
