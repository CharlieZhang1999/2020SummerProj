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
import FirebaseStorage

class signupViewController: UIViewController {

    @IBOutlet weak var firstnameTF2: UITextField!
    @IBOutlet weak var lastnameTF2: UITextField!
    @IBOutlet weak var emailTF2: UITextField!
    @IBOutlet weak var usernameTF2: UITextField!
    @IBOutlet weak var passwordTF2: UITextField!
    @IBOutlet weak var signupBT2: UIButton!
    @IBOutlet weak var errorLB2: UILabel!
    @IBOutlet weak var userIMG2: UIImageView!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setUpUserImg()
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
    
    func setUpUserImg() {
        userIMG2.layer.cornerRadius = userIMG2.frame.size.width / 2
        userIMG2.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        userIMG2.addGestureRecognizer(tapGesture)
    }
    
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
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
        
        guard let imageSelected = self.image else {
            showError("Please select a profile image")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        
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
            let profileImageURL: String! = ""
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                } else {
                    let storageRef = Storage.storage().reference(forURL: "gs://gouge-54305.appspot.com")
                    let storageProfileRef = storageRef.child("user_profile_image").child(result!.user.uid)
                    let metadata = StorageMetadata()
                    metadata.contentType = "image/jpg"
                    storageProfileRef.putData(imageData, metadata: metadata) { (StorageMetaData, error) in
                        if error != nil {
                            return
                        }
                        storageProfileRef.downloadURL { (url, error) in
                            if let metaImageUrl = url?.absoluteString {
                                UserDefaults.standard.set(metaImageUrl, forKey: "profileIMG")
                                
                            }
                        }
                    }
                    
                    let db = Firestore.firestore()
                    db.collection("users").document(result!.user.uid).setData(["emailAddress": email, "firstName": firstName, "lastName": lastName, "userName": username, "uid": result!.user.uid, "profileImageURL": profileImageURL!]) { (error) in
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

extension signupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = imageSelected
            userIMG2.image = imageSelected
        }
    
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = imageOriginal
            userIMG2.image = imageOriginal
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

