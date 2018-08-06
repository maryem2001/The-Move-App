//
//  Contact Us.swift
//  The Move
//
//  Created by Maryem W Ali on 8/2/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit

class ContactUs: UIViewController{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
//    }
    @IBOutlet weak var feedbackMessageLabel: UILabel!
    
    @IBOutlet weak var feedbackTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func submitButtonPressed(_ sender: Any) {
        present(submitAlert, animated: true, completion: nil)
//        submitAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    }
        let submitAlert = UIAlertController(title: "Submitted", message: "Your feedback has been submitted to the developers, thank you.", preferredStyle: UIAlertControllerStyle.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
                submitAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
