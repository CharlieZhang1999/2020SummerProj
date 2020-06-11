//
//  DemoTableTableViewCell.swift
//  2020SummerProj
//
//  Created by djogem on 2020/6/4.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

/*protocol DemoTableTableViewCellDelegate: AnyObject{
    func didTapButton(with section: Int)
}*/

class DemoTableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImageview: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    //weak var delegate: DemoTableTableViewCellDelegate?
    @IBOutlet weak var mypricelabel: UILabel!
    var mytitle: String = ""
    var myprice: Double = 0
    var mysection: Int = 0
    

    static let identifier = "DemoTableTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DemoTableTableViewCell", bundle: nil)
    }
    func configure(with title: String, imageName: String, price: Double, section: Int){//this is like a init function
        mytitle = title
        mysection = section
        myprice = price
        mypricelabel.text = "\(myprice)$"
        myButton.setTitle(mytitle, for: .normal)
        myImageview.image = UIImage(named: imageName)
    }
/*    @IBAction func didTapButton(_ sender: UIButton) {
        delegate?.didTapButton(with: section)
        
    }*/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
