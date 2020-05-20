//
//  signupViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit

class signupViewController: UIViewController {

    @IBOutlet weak var firstnameTF2: UITextField!
    @IBOutlet weak var lastnameTF2: UITextField!
    @IBOutlet weak var emailTF2: UITextField!
    @IBOutlet weak var usernameTF2: UITextField!
    @IBOutlet weak var passwordTF2: UITextField!
    @IBOutlet weak var signupBT2: UIButton!
    @IBOutlet weak var errorLB2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        errorLB2.alpha = 0
        Utilities.styleTextField(firstnameTF2)
        Utilities.styleTextField(lastnameTF2)
        Utilities.styleTextField(emailTF2)
        Utilities.styleTextField(usernameTF2)
        Utilities.styleTextField(passwordTF2)
        Utilities.styleFilledButton(signupBT2)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func signupTapped(_ sender: Any) {
    }
    

}
