//
//  signupViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class signupViewController: UIViewController {

    @IBOutlet weak var firstnameTF2: UITextField!
    @IBOutlet weak var lastnameTF2: UITextField!
    @IBOutlet weak var emailTF2: UITextField!
    @IBOutlet weak var usernameTF2: UITextField!
    @IBOutlet weak var passwordTF2: UITextField!
    @IBOutlet weak var signupBT2: UIButton!
    @IBOutlet weak var errorLB2: UILabel!
    @IBOutlet weak var userIMG2: UIImageView!
    
    func configure() {
        errorLB2.alpha = 0
        userIMG2.layer.cornerRadius = userIMG2.frame.size.width / 2
        Utilities.styleTextField(firstnameTF2)
        Utilities.styleTextField(lastnameTF2)
        Utilities.styleTextField(emailTF2)
        Utilities.styleTextField(usernameTF2)
        Utilities.styleTextField(passwordTF2)
        Utilities.styleFilledButton(signupBT2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // Validate the fields. If everything is correct, this method returns nil or error message otherwise.
    func validateFieldd() -> String? {
        
        // Check that all fields are non-empty
        if firstnameTF2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastnameTF2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTF2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usernameTF2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTF2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all the required fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTF2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "You password is not secure enough!"
        }
        
        // Check if the email format is valid
        let cleanedEmail = emailTF2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isEmailValid(cleanedEmail) == false {
            return "Please enter a valid email address!"
        }
        
        return nil
    }
    
    func showError(_ message:String) {
        errorLB2.text = message
        errorLB2.alpha = 1
    }
    
    func transitionToLoginView() {
        let LoginViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.LoginViewController) as? loginViewController
        
        self.view.window?.rootViewController = LoginViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        
        // Validate the fields
        let errorMessage = validateFieldd()
        if errorMessage != nil {
            showError(errorMessage!)
        } else {
            // Create cleaned versions of the data
            let firstName = firstnameTF2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastnameTF2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTF2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = usernameTF2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTF2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                } else {
                    let db = Firestore.firestore()
                    
                    db.collection("users").document(result!.user.uid).setData(["firstName": firstName, "lastName": lastName, "username": username, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Error saving user profiles.")
                        } else {
                            self.transitionToLoginView()
                        }
                    }
                }
            }
        }
    }
    

}
