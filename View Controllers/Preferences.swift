//
//  Preferences.swift
//  The Move
//
//  Created by Maryem W Ali on 8/2/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit

class Preferences : UIViewController {
    
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageSelect: UISegmentedControl!
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var budgetSelect: UISegmentedControl!
    

    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        present(savedAlert, animated: true, completion: nil)
        
    }
    let savedAlert = UIAlertController(title: "Saved", message: "Prefernce changes have been saved.", preferredStyle: UIAlertControllerStyle.alert)
    
//    present(savedhAlert, animated: true, completion: nil)
//    var savedAlert = UIAlertController(title: "Saved", message: "Prefernce changes have been saved.", preferredStyle: UIAlertControllerStyle.alert)
//   savedAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
////    self.present(savedAlert, animated: true, completion: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
//        present(savedAlert, animated: true, completion: nil)
//         savedAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
    }
  
    @IBOutlet var background: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
}

