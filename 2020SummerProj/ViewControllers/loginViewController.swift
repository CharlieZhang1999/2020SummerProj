//
//  loginViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    
    @IBOutlet weak var usernameTF1: UITextField!
    @IBOutlet weak var passwordTF1: UITextField!
    @IBOutlet weak var loginBT1: UIButton!
    @IBOutlet weak var errorLB1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        errorLB1.alpha = 0
        Utilities.styleTextField(usernameTF1)
        Utilities.styleTextField(passwordTF1)
        Utilities.styleFilledButton(loginBT1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    

}
