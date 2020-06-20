//
//  ChatViewController.swift
//  2020SummerProj
//
//  Created by 薛凡 on 6/13/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import MessageKit

struct Sender:SenderType {
    
    var senderId: String
    
    var displayName: String
    
}

struct Message: MessageType {
    
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind

}


class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let currentUser = Sender(senderId: "self", displayName: "Gabby")
    
    let otherUser = Sender(senderId: "other", displayName: "Arya Stark")
    
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-8000),
                                kind: .text("Hey there, I'm Gabby ;)")))
        
        messages.append(Message(sender: otherUser,
                                messageId:"2",
                                sentDate: Date().addingTimeInterval(-7000),
                                kind: .text("Hi Gabby, I'm Arya.")))
        
        messages.append(Message(sender: otherUser,
                                       messageId:"3",
                                       sentDate: Date().addingTimeInterval(-6000),
                                       kind: .text("Valar morghulis")))
        
        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-5000), kind: .text("Valar dohaeris")))
        
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    

}
