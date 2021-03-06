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
  
//        self.delegate = self
//
//        DispatchQueue.main.async {
//            if FIRAuth.auth()?.currentUser == nil {
//                let loginController = LoginController()
//                let navController = UINavigationController(rootViewController: loginController)
//                self.present(navController, animated: true, completion: nil)
//            }
//            return
//        }
//
        view.setGradiantBackground(colorOne:UIColor(red: 0.0/225.0, green:181.0/225.0, blue: 245.0/225.0, alpha: 1.0), colorTwo:UIColor(red: 119.0/225.0, green:28.0/225.0, blue: 250.0/225.0, alpha:1.0))
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
   
//    AuthUI.getInstance().createSignInIntentBuilder().setProviders(
//    AuthUI.EMAIL_PROVIDER,
//    AuthUI.FACEBOOK_PROVIDER)
//    **.setTheme(R.style.SuperAppTheme)**
//    .build(),
//    RC_SIGN_IN);
    

    
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
 
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
        
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                User.setCurrent(user)

                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        }
    }
    }


