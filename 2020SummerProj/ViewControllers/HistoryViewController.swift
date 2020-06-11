//
//  HistoryViewController.swift
//  2020SummerProj
//
//  Created by djogem on 2020/6/11.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
        var productcellarray: [DemoTableTableViewCell] = []
        let purchases = [
            ("Porsche 911", 20.0),
            ("Aston Martin DB9", 10.0),
            ("Ferrari F12", 50.0)
        ]
        
        let selling = [
            ("Benz S-class", 30.0),
            ("Benz G500", 28.0)
        ]
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if(section == 0){
                return purchases.count
            }
            else{
                return selling.count
            }
        }


        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: DemoTableTableViewCell.identifier, for: indexPath) as! DemoTableTableViewCell
            if(indexPath.section == 0){
                var (purchasename, purchaseprice) = purchases[indexPath.row]
                //cell.delegate = self
                cell.configure(with: purchasename, imageName: purchasename, price: purchaseprice, section: indexPath.section)
                productcellarray.append(cell)
            }
            else{
                var (sellingname, sellingprice) = selling[indexPath.row]
                //cell.delegate = self
                cell.configure(with: sellingname, imageName: sellingname, price: sellingprice, section: indexPath.section)
                productcellarray.append(cell)
            }
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showdetail", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? HistoryDetailViewController{
                destination.myproduct = productcellarray[(tableView.indexPathForSelectedRow?.row)!]
                tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
            }
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.register(DemoTableTableViewCell.nib(), forCellReuseIdentifier: DemoTableTableViewCell.identifier)
            tableView.dataSource = self
            tableView.delegate = self
            // Do any additional setup after loading the view.
        }
        
    }
