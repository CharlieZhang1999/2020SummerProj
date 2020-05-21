//
//  loginViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: UIViewController {

    @IBOutlet weak var emailTF1: UITextField!
    @IBOutlet weak var passwordTF1: UITextField!
    @IBOutlet weak var loginBT1: UIButton!
    @IBOutlet weak var errorLB1: UILabel!
    
    func configure() {
        errorLB1.alpha = 0
        Utilities.styleTextField(emailTF1)
        Utilities.styleTextField(passwordTF1)
        Utilities.styleFilledButton(loginBT1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func showError(_ message:String) {
        errorLB1.text = message
        errorLB1.alpha = 1
    }
    
    func transitionToHomepageView() {
        let HomepageViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomepageViewController) as? homepageViewController
        
        self.view.window?.rootViewController = HomepageViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // Validate Text Fields and create cleaned versions of the text field
        let email = emailTF1.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTF1.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if email == "" || password == "" {
            showError("Please fill in all the required fields")
        } else {
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    self.showError("Credentials invalid!")
                } else {
                    self.transitionToHomepageView()
                }
            }
        }
    }
    

}
