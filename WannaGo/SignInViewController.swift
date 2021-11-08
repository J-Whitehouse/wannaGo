//
//  SignInViewController.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/8/21.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController {
    let signInConfig = GIDConfiguration.init(clientID:
        "851357286012-oq6hoi244jf01is14e4skdqnis16llkr.apps.googleusercontent.com")
    
    //MARK: Outlets and actions
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction func signIn(_ sender: Any){
        print("you have joined the cult")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) {
            user, error in
            
            guard error == nil else {return}
            
            guard let user = user else {return}
            
            print(user.profile?.email)
            print(user.userID)
            
            self.performSegue(withIdentifier: "viewPlaces", sender: nil)
        }
        
    }
    
    @IBAction func singOut(_ sender: Any) {
        print("Dont leave me")
        GIDSignIn.sharedInstance.signOut()
    }
    
    //MARK: LIFecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = GIDSignIn.sharedInstance.currentUser {
            self.performSegue(withIdentifier: "viewPlaces", sender: nil)        }
    }
}
