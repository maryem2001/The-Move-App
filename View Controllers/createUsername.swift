//
//  createUsername.swift
//  The Move
//
//  Created by Maryem W Ali on 8/6/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
  
    @IBOutlet weak var createUsernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradiantBackground(colorOne:UIColor(red: 0.0/225.0, green:181.0/225.0, blue: 245.0/225.0, alpha: 1.0), colorTwo:UIColor(red: 119.0/225.0, green:28.0/225.0, blue: 250.0/225.0, alpha:1.0))
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
            let username = createUsernameTextField.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {

                return
            }
            
            User.setCurrent(user)
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                
    }
}
}
}

