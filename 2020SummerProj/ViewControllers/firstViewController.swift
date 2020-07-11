////
////  firstViewController.swift
////  2020SummerProj
////
////  Created by Ted on 5/21/20.
////  Copyright © 2020 香槟最靓的仔. All rights reserved.
////
//
//import UIKit
//
//class firstViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//}
//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Emily Ling on 2020/6/7.
//  Copyright © 2020 Jiayi Ling. All rights reserved.
//

import UIKit
import MapKit

struct Item {
    var itemName: String
    var price: double_t
    var imageName: String
}
class firstViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellidentifier = "ItemCollectionViewCell"
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"
    //var page: Int!
    
    @IBAction func SegControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            collectionView.isHidden = false
            mapView.isHidden = true
        } else {
            collectionView.isHidden = true
            mapView.isHidden = false
        }
    }
    
    var data:[Item] = [Item(itemName: "5W USB Official OEM Charger and Power", price: 19.9, imageName: "1"),
                        Item(itemName: "Fire 7 Tablet - Black", price: 49.99, imageName: "2"),
                        Item(itemName: "Alexa Voice Remote", price: 39.99, imageName: "3"),
                        Item(itemName: "Echo Dot (3rd Gen)", price: 49.99, imageName: "4"),
                        Item(itemName: "Champion Men's Jersey Short With Pockets", price: 11.20, imageName: "5"),
                        Item(itemName: "CROC Classic Clog", price: 25.49, imageName: "6"),
                        Item(itemName: "Polarized Aviator Sunglasses", price: 16.99, imageName: "7"),
                        Item(itemName: "Remington R5000 Series Electric Rotary Shaver", price: 80.0, imageName: "8")]
    var items:[Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        mapView.isHidden = true
        items = data
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: cellidentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellidentifier)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        if segue.identifier == viewImageSegueIdentifier {
            if let vc = segue.destination as? ImageViewerViewController {
                vc.imageName = item.imageName
                vc.itemN = item.itemName
                vc.price = item.price
            }
        }
        
        
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let itemPerRow: CGFloat = 2
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
            let width = (collectionView.frame.width - (itemPerRow - 1) *  interItemSpacing) / itemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension firstViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

extension firstViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath) as! ItemCollectionViewCell
        cell.imageView.image = UIImage(named: "\(items[indexPath.item].imageName)-1")
        cell.priceLabel.attributedText = NSAttributedString.init(string: "\(String(items[indexPath.item].price)) $/day")
        cell.nameLabel.attributedText = NSAttributedString.init(string: items[indexPath.item].itemName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = items[indexPath.item]
        performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
    }
}
