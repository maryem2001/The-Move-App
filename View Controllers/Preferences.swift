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
    
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//            return 1
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerData.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerData[row]
//    }
////    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
////        let string = "myString"
////        return NSAttributedString(string: string, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
////    }
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let titleData = pickerData[row]
//        let myTitle = NSAttributedString(string: titleData, attributes: [kCTFontAttributeName as NSAttributedStringKey:UIFont(name: "Georgia", size: 15.0)!,kCTForegroundColorAttributeName as NSAttributedStringKey:UIColor.white])
//        return myTitle
//    }
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageSelect: UISegmentedControl!
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var budgetSelect: UISegmentedControl!
    
    @IBOutlet weak var moveTypeLabel: UILabel!
    @IBOutlet weak var moveTypeSelect: UISegmentedControl!
    @IBAction func moveTypeSelectPressed(_ sender: AnyObject) {
        switch moveTypeSelect.selectedSegmentIndex
        {
        case 0:
            Common.Global.moveType = "Resturaunt";
        case 1:
            Common.Global.moveType = "Night Club";
        case 2:
            Common.Global.moveType = "Arcade";
        default:
            break
        }
    }

//    @IBOutlet weak var moveTypePicker: UIPickerView!
//        var pickerData: [String] = [String]()
//
    
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
        
        
        
//        self.moveTypePicker.delegate = self
//        self.moveTypePicker.dataSource = self
//        pickerData = ["Eat", "Party", "Play"]
        
        savedAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
//        present(savedAlert, animated: true, completion: nil)
//         savedAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        view.setGradiantBackground(colorOne:UIColor(red: 0.0/225.0, green:181.0/225.0, blue: 245.0/225.0, alpha: 1.0), colorTwo:UIColor(red: 119.0/225.0, green:28.0/225.0, blue: 250.0/225.0, alpha:1.0))    }
    
  
    @IBOutlet var background: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
}

