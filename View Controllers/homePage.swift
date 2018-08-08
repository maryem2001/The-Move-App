//
//  homePage.swift
//  The Move
//
//  Created by Maryem W Ali on 8/1/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class homePage: UIViewController {

    var menuShowing = false
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBAction func openMenu(_ sender: Any) {
        if (menuShowing) {
            leadingConstraint.constant = -150
        } else { leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.3,
                    animations: {
                        self.view.layoutIfNeeded()
            })
        }
       menuShowing = !menuShowing
        
    }
    

    @IBOutlet weak var contactUsButton: UIButton!
    
    @IBOutlet weak var nameOfUserLabel: UILabel!
    @IBOutlet weak var username: UILabel!
    
    
    //@IBOutlet weak var profilePic: UIImageView!
    
    @IBAction func generateButton(_ sender: Any) {
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = Auth.auth().currentUser
        self.nameOfUserLabel.text = user?.displayName
//        self.username.text = user?.username
        
        //self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2
        //self.profilePic.clipsToBounds = true
       
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 4

        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
        menuView.backgroundColor=UIColor(red: 131.0/225.0, green:149.0/225.0, blue: 167.0/225.0, alpha: 0.85)
        navigationController?.navigationBar.isTranslucent = false
    }
}

extension UIView {
    func setGradiantBackground(colorOne: UIColor, colorTwo: UIColor){
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.frame = bounds
        gradiantLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradiantLayer.locations = [0.0,2.75]
        gradiantLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradiantLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradiantLayer, at: 0)
        
    }
}

//extension UIImageView {
//    func roundedImage() {
//        self.layer.cornerRadius = self.frame.size.width / 2
//        self.clipsToBounds = true
//    }
//}
//
//extension generateButton{
//    func vibrate(){
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.duration = 0.05
//        animation.repeatCount = 5
//        animation.autoreverses = true
//        animation.fromValue = NSValue(cgPoint: CGPoint(x:self.center.x - 2.0, y:self.center.y))
//        animation.toValue = NSValue(cgPoint: CGPoint(x:self.center.x + 2.0, y:self.center.y))
//        self.layer.add(animation, forKey: "position")
//    }
//}
