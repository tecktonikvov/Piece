//  Created by Mac on 18.08.2021.
//

import Foundation

struct Member {
    let name: String
    let avatarUrl: String?
    let phone: String
    
    public static var mock = [Member(name: "Alex", avatarUrl: nil, phone: "+39492734677"),
                              Member(name: "Valya", avatarUrl: nil, phone: "+39492734677"),
                              Member(name: "Cergo", avatarUrl: nil, phone: "+39492734677")]
}
