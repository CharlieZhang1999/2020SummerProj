//
//  UserCell.swift
//  2020SummerProj
//
//  Created by 薛凡 on 6/29/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class UserCell: UITableViewCell {
    
    @IBOutlet weak var UserName: UILabel!
    
    func setUserInfo(info: UserCellInfo) {
        
        UserName.text = info.title
        
    }
    
}
