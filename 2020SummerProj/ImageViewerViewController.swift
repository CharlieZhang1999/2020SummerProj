//
//  ImageViewerViewController.swift
//  CollectionViewTest
//
//  Created by Emily Ling on 2020/6/7.
//  Copyright © 2020 Jiayi Ling. All rights reserved.
//

import UIKit
import MapKit

class ImageViewerViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var button: UIButton!
    var imageName: String!
    var itemN: String!
    var price: double_t!
    @IBOutlet weak var ScrollViewItemNameLabel: UILabel!
    @IBOutlet weak var ScrollViewPriceLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func tapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageView()
        button.setTitleShadowColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), for: UIControl.State.init())
        button.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 15.0
        button.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        guard let realprice = price else {
            return
        }
        ScrollViewPriceLabel.attributedText = NSAttributedString.init(string: "\(realprice) $/day")
        ScrollViewItemNameLabel.attributedText = NSAttributedString.init(string: itemN)
        
        mapView.delegate = self
        mapView.layer.cornerRadius = 10
        mapView.layer.borderWidth = 4
        mapView.layer.borderColor = #colorLiteral(red: 1, green: 0.2303824723, blue: 0.1861867011, alpha: 1)
 
    }
    
    private func setUpImageView() {
        guard let name = imageName else {
            return
        }
        if let image = UIImage(named: "\(name)-1") {
            imageView.image = image
        }
        if let image = UIImage(named: "\(name)-2") {
            image2.image = image
        }
        if let image = UIImage(named: "\(name)-3") {
            image3.image = image
        }
    }
}
