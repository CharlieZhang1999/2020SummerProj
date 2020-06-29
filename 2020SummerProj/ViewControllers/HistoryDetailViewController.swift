//
//  HistoryDetailViewController.swift
//  2020SummerProj
//
//  Created by djogem on 2020/6/11.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController, UIScrollViewDelegate {

           weak var myproduct: Product!
           @IBOutlet weak var myTextview: UITextView!
           //@IBOutlet weak var myLabel: UILabel!
       

           @IBOutlet weak var myBigScrollView: UIScrollView!
           @IBOutlet weak var myScrollview: UIScrollView!
           @IBOutlet weak var myPagecontrol: UIPageControl!
           
           @IBOutlet weak var mypurchaseDate: UILabel!
           @IBOutlet weak var myTitle: UILabel!
            @IBOutlet weak var mysellerImageView: UIImageView!
           @IBOutlet weak var mysellerName: UILabel!
           var frame = CGRect(x:0, y:0, width:0, height:0)
       
           override func viewDidLoad() {
               super.viewDidLoad()
               myPagecontrol.numberOfPages = myproduct.productImages.count
               for index in 0..<myproduct.productImages.count{
                   frame.origin.x = myScrollview.frame.size.width * CGFloat(index)
                   frame.size = myScrollview.frame.size
                   let myImageView = UIImageView(frame: frame)
                   myImageView.image = UIImage(named: myproduct.productImages[index])
                   myImageView.contentMode = .scaleAspectFill
                   myScrollview.addSubview(myImageView)
               }
               myScrollview.contentSize = CGSize(width: myScrollview.frame.size.width * CGFloat(myproduct.productImages.count), height: myScrollview.frame.size.height)
               myScrollview.delegate = self

               let productdescription = myproduct?.productDescription; let producttitle = myproduct?.productTitle
               if(productdescription != nil){
                   myTextview.text = "\(productdescription!)"
                   myTitle.text = "\(producttitle!)"
               }
               mysellerImageView.layer.cornerRadius = mysellerImageView.frame.height/2
               mysellerImageView.clipsToBounds = true
               mysellerImageView.image = UIImage(named: "Benz G500")
               mysellerName.text = "Username"
               mypurchaseDate.text = "Jun,10"
               
               // Do any additional setup after loading the view.
               myBigScrollView.addSubview(myScrollview)
               myBigScrollView.addSubview(mypurchaseDate)
               myBigScrollView.addSubview(myTitle)
               myBigScrollView.addSubview(mysellerImageView)
               myBigScrollView.addSubview(mysellerName)
               myBigScrollView.addSubview(myTextview)
               myBigScrollView.contentSize = CGSize(width: view.frame.size.width, height: 2200)
               //myBigScrollView.delegate = self
               
           }
           
           func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
               var pagenumber = myScrollview.contentOffset.x / myScrollview.frame.size.width
               myPagecontrol.currentPage = Int(pagenumber)
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
