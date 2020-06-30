//
//  ItemCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by Emily Ling on 2020/6/7.
//  Copyright © 2020 Jiayi Ling. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let whiteView = UIView(frame: bounds)
        whiteView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.backgroundView = whiteView

        let darkView = UIView(frame: bounds)
        darkView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.selectedBackgroundView = darkView
        
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.borderWidth = 10.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    

}
