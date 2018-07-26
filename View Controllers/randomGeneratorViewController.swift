//
//  randomGeneratorViewController.swift
//  The Move
//
//  Created by Maryem W Ali on 7/25/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit

class randomGeneratorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomGenerateButton(_ sender: Any) {
        performSegue(withIdentifier: "segueRandomGeneratorToEvent", sender: self)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
