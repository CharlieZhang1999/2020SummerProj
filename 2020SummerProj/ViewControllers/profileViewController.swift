//
//  thirdViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/21/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class thirdViewController: UIViewController {
    
    private var usersCollectionRef: CollectionReference = Firestore.firestore().collection("users")

    @IBOutlet weak var backgroundIMG6: UIImageView!
    @IBOutlet weak var profileIMG6: UIImageView!
    @IBOutlet weak var usernameLB6: UITextField!
    @IBOutlet weak var emailLB6: UITextField!
    @IBOutlet weak var firstnameLB6: UITextField!
    @IBOutlet weak var lastnameLB6: UITextField!
    
    @IBOutlet weak var editBT6: UIBarButtonItem!
    @IBOutlet weak var errorLB6: UILabel!
    @IBOutlet weak var saveBT6: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchUserInfo()
    }
    
    
    func configure() {
        profileIMG6.layer.cornerRadius = profileIMG6.frame.size.width / 2
        errorLB6.alpha = 0
        Utilities.styleHollowButton(saveBT6)
    }
    
    
    func fetchUserInfo() {
        usersCollectionRef.document(Auth.auth().currentUser!.uid).getDocument { (snapshot, error) in
            if error != nil {
                return
            } else {
                guard let data = snapshot?.data() else {return}
                let firstname = data["firstName"] as? String ?? "Anonymous"
                let lastname = data["lastName"] as? String ?? "Anonymous"
                let username = data["userName"] as? String ?? "Anonymous"
                let uid = data["uid"] as? String ?? "Anonymous"
                let email = data["emailAddress"] as? String ?? "Anonymous"
                let profileImageURL = data["profileImageURL"] as? String ?? "Anonymous"
                
                let newUser = User(firstName: firstname, lastName: lastname, username: username, uid: uid, email: email, profileImageURL: profileImageURL)
                self.usernameLB6.text = newUser.username
                self.firstnameLB6.text = newUser.firstName
                self.lastnameLB6.text = newUser.lastName
                self.emailLB6.text = newUser.email
            }
        }
    }
    
    func transitionToInitialView() {
        let InitialViewController = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? loginViewController
        self.view.window?.rootViewController = InitialViewController
        self.view.window?.makeKeyAndVisible()
    }

    @IBAction func logoutTapped(_ sender: Any) {
        
        let auth = Auth.auth()
        do {
            try auth.signOut()
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            transitionToInitialView()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func editTapped(_ sender: Any) {
        editBT6.title = "Editting"
        usernameLB6.isUserInteractionEnabled = true
        emailLB6.isUserInteractionEnabled = true
        firstnameLB6.isUserInteractionEnabled = true
        lastnameLB6.isUserInteractionEnabled = true
        saveBT6.isHidden = false
        saveBT6.isEnabled = true
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let username = usernameLB6.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let firstname = firstnameLB6.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastname = lastnameLB6.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailLB6.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let individualRef = usersCollectionRef.document(Auth.auth().currentUser!.uid)
        individualRef.updateData(["firstName": firstname, "lastName": lastname, "userName": username, "emailAddress": email]) { (error) in
            if error != nil {
                self.showError("Error updating the user profile!")
            } else {
                self.afterSave()
            }
        }
    }
    
    func showError(_ message:String) {
        errorLB6.text = message
        errorLB6.alpha = 1
    }
    
    func afterSave() {
        editBT6.title = "Edit"
        usernameLB6.isUserInteractionEnabled = false
        emailLB6.isUserInteractionEnabled = false
        firstnameLB6.isUserInteractionEnabled = false
        lastnameLB6.isUserInteractionEnabled = false
        saveBT6.isHidden = true
        saveBT6.isEnabled = false
    }
    
    
}
