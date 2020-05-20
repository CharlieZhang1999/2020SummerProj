//
//  initialViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

class initialViewController: UIViewController {
    
    
    @IBOutlet weak var loginBT0: UIButton!
    @IBOutlet weak var signupBT0: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        Utilities.styleHollowButton(loginBT0)
        Utilities.styleHollowButton(signupBT0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
