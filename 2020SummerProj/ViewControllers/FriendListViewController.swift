//
//  FriendListViewController.swift
//  2020SummerProj
//
//  Created by 薛凡 on 6/8/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import Firebase

class FriendListViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    // Table View data
    var info: [FriendCellInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load all the images and labels on on to the table cell
        info = createArray()
        
        // show the table view
        TableView.delegate = self
        TableView.dataSource = self
        
    }
    
    // Create Friend Cell Info object array
    func createArray() -> [FriendCellInfo] {
        
        var tempInfos: [FriendCellInfo] = []
        
        let info0 = FriendCellInfo(image: UIImage(named: "Arya_Stark")!, title: "Arya Stark")
        let info1 = FriendCellInfo(image: UIImage(named: "Grey_Worm")!, title: "Grey Worm")
        let info2 = FriendCellInfo(image: UIImage(named: "Daenerys_Targaryen")!, title: "Daenerys Targaryen")
        let info3 = FriendCellInfo(image: UIImage(named: "Tyrion_Lannister")!, title: "Tyrion Lannister")
    
        tempInfos.append(info0)
        tempInfos.append(info1)
        tempInfos.append(info2)
        tempInfos.append(info3)
        
        return tempInfos
    }
    
}

extension FriendListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    // Set up individual cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = info[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! FriendCell
        
        cell.setFriendInfo(info: item)
        
        return cell
    }
}

