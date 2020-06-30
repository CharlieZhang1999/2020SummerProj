//
//  Message.swift
//  2020SummerProj
//
//  Created by 薛凡 on 6/29/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import Foundation
import MessageKit

struct Member {
    let name: String
    let color: UIColor
}

struct Message {
    let member: Member
    let text: String
    let messageId: String
}

extension Message: MessageType {
    var sender: SenderType {
        return Sender(senderId: member.name, displayName: member.name)
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}
