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
    
    @IBOutlet weak var cellImageview: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    //weak var delegate: DemoTableTableViewCellDelegate?
    @IBOutlet weak var cellpricelabel: UILabel!
    var celltitle: String = ""
    var cellprice: Double = 0
    var cellimages: [String] = [""]
    var celldate: String = ""

    static let identifier = "DemoTableTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DemoTableTableViewCell", bundle: nil)
    }
    func configure(with title: String, imageName: [String], price: Double, date: String){//this is like a init function
        celltitle = title
        celldate = date
        cellprice = price
        cellpricelabel.text = "\(cellprice)$"
        cellButton.setTitle(celltitle, for: .normal)
        cellimages = imageName
        cellImageview.image = UIImage(named: cellimages[0])//only use the first picture for the cover

    }
/*    @IBAction func didTapButton(_ sender: UIButton) {
        delegate?.didTapButton(with: section)
        
    }*/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
