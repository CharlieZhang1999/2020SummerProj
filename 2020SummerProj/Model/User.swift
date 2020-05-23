//
//  File.swift
//  2020SummerProj
//
//  Created by Ted on 5/22/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import Foundation

class User {
    private(set) var firstName: String!
    private(set) var lastName: String!
    private(set) var username: String!
    private(set) var uid: String!
    private(set) var email: String!
    
    init(firstName: String!, lastName: String!, username: String!, uid: String!, email: String!) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.uid = uid
        self.email = email
    }
    
    func return_firstName() -> String {
        return self.firstName
    }
    
    func return_lastName() -> String {
        return self.lastName
    }
    
    func return_username() -> String {
        return self.username
    }
    
    func return_uid() -> String {
        return self.uid
    }
    
    func return_email() -> String {
        return self.email
    }
    
}
