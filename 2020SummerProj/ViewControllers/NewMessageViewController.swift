//
//  NewMessageViewController.swift
//  2020SummerProj
//
//  Created by 薛凡 on 6/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import Firebase

class NewMessageViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    // Fetch db collection from firestore
    private var usersCollectionRef: CollectionReference = Firestore.firestore().collection("users")
    
    // User List
    var info: [UserCellInfo] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Give the value to info
        info = fetchUserInfo()
        
        print("reach here")
        // Still empty here...
        print(info)
        
        for data in info {
            print(data)
        }
        
        TableView.delegate = self
        TableView.dataSource = self
        
    }
    
    func fetchUserInfo() -> [UserCellInfo] {
        
        var tempInfos: [UserCellInfo] = []
        
        // usersCollectionRef here is a CollectionReference
        usersCollectionRef.getDocuments() {
            (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }
            else {
                for document in querySnapshot!.documents {
                    let userName = document.data()["userName"] as! String
                    self.info.append(UserCellInfo(title: "\(userName)"))
                }
            }
            print(tempInfos)
        }
        print(tempInfos)
        return tempInfos
    }
    
}

extension NewMessageViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return info.count
        
    }
    
    // Set up individual cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = info[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"userCell") as! UserCell
        
        cell.setUserInfo(info: item)
        
        return cell
        
    }
}


