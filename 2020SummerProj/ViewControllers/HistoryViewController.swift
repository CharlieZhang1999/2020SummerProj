//
//  HistoryViewController.swift
//  2020SummerProj
//
//  Created by djogem on 2020/6/11.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

class Product {
    var productTitle: String = ""
    var productDescription: String = ""
    var purchaseDate: String = ""
    var productPrice: Double = 0
    var productImages: [String] = [""]
    init(name: String, description: String, price: Double, date: String, images: [String]) {
        productTitle = name
        productDescription = description
        purchaseDate = date
        productPrice = price
        productImages = images
    }
}
class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        @IBOutlet var tableView: UITableView!
        var productarray: [Product] = []
        var data = [
                    ("Aston Martin DB9", "The best British car", 10.0, "06-10"),
                    ("Ferrari F12", "Made in Italy.", 50.0, "06-10"),
                    ("Benz S-class","Made in Germany. Condition: Well", 30.0, "06-10"),
                    ("Benz G500", "Made in Germany", 28.0, "06-10")
                ]
                    /*("Aston Martin DB9", 10.0),
                    ("Ferrari F12", 50.0),
                    ("Benz S-class", 30.0),
                    ("Benz G500", 28.0)
                ]*/
            
        var imagedata = [
                ["Aston Martin DB9", "Aston Martin DB9_1"],
                ["Ferrari F12"],
                ["Benz S-class"],
                ["Benz G500", "Benz G500_1", "Benz G500_2"]
            ]
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }


        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var (productname, productdescription, productprice, productdate) = data[indexPath.row]
            var productimages = imagedata[indexPath.row]
            var product = Product(name: productname, description: productdescription, price: productprice, date: productdate, images: productimages)
            productarray.append(product)
            
            var cell = tableView.dequeueReusableCell(withIdentifier: DemoTableTableViewCell.identifier, for: indexPath) as! DemoTableTableViewCell
            cell.configure(with: productname, imageName: productimages, price: productprice, date: productdate)
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110
        }
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if(editingStyle == .delete){
                self.data.remove(at: indexPath.row)
                self.tableView.reloadData()
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showdetail", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? HistoryDetailViewController{
                destination.myproduct = productarray[(tableView.indexPathForSelectedRow?.row)!]
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
