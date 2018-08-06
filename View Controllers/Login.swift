//
//  Login.swift
//  The Move
//
//  Created by Maryem W Ali on 8/6/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
   

   
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func loginButtonTapped(_ sender: Any){  
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }

        authUI.delegate = self as? FUIAuthDelegate

        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
//        self.performSegue(withIdentifier: "toCreateUsername", sender: self)
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }

        guard let user = authDataResult?.user
            else { return }

        let userRef = Database.database().reference().child("users").child(user.uid)


        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let user = User(snapshot: snapshot) {
//                User.
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
    }
}
