//
//  Chat.swift
//  2020SummerProj
//
//  Created by 薛凡 on 6/29/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

struct Chat {
    
    var users: [String]
    
    var dictionary: [String: Any] {
        return ["users": users]
    }
    
}

extension Chat {
    
    init? (dictionary: [String: Any]) {
        guard let chatUsers = dictionary["users"] as? [String] else {
            return nil
        }
        self.init(users: chatUsers)
    }
    
}
