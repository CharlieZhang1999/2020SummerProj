//
//  HistoryDetailViewController.swift
//  2020SummerProj
//
//  Created by djogem on 2020/6/11.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {

       weak var myproduct: DemoTableTableViewCell!
        @IBOutlet weak var myImageview: UIImageView!
        @IBOutlet weak var myTextview: UITextView!
        //@IBOutlet weak var myLabel: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            myImageview.image = myproduct.myImageview.image
            let productname = myproduct?.mytitle; let productcategory = myproduct?.mysection
            if(productname != nil && productcategory != nil){
                 myTextview.text = "\(productname!) comes under the section \(productcategory!)"
            }
            // Do any additional setup after loading the view.
        }
        
        /*func configure(with title: String, imageName: String){
            mytextview.text = title
            myImageview.image = UIImage(named: imageName)
        }*/
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

}
