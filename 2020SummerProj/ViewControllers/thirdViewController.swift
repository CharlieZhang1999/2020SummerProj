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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchUserInfo()
    }
    
    
    func configure() {
        profileIMG6.layer.cornerRadius = profileIMG6.frame.size.width / 2
        
    }
    
    
    func fetchUserInfo() {
        usersCollectionRef.document(Auth.auth().currentUser!.uid).getDocument { (snapshot, error) in
            if error != nil {
                return
            } else {
                guard let data = snapshot?.data() else {return}
                let firstname = data["firstName"] as? String ?? "Anonymous"
                let lastname = data["lastName"] as? String ?? "Anonymous"
                let username = data["username"] as? String ?? "Anonymous"
                let uid = data["uid"] as? String ?? "Anonymous"
                let email = Auth.auth().currentUser?.email ?? "Anonymous"
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
    

}
