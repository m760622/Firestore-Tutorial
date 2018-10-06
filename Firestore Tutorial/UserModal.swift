//
//  UserModal.swift
//  Firestore Tutorial
//
//  Created by Uladzislau Daratsiuk on 10/6/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

protocol DocumentUserSerializable {
    init?(dictionary: [String: Any])
}

struct UserModal {
    var id: Int
    var username: String
    var password: String
    
    var dictionary: [String: Any] {
        return [
            "id": id,
            "username": username,
            "password": password
        ]
    }
}

extension UserModal: DocumentUserSerializable {
    init?(dictionary: [String : Any]) {
        guard let id = dictionary["id"] as? Int,
            let username = dictionary["username"] as? String,
            let password = dictionary["password"] as? String else {return nil}
        self.init(id: id, username: username, password: password)
    }
    
    
    
}
