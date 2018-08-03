//
//  MoveEventDisplay.swift
//  The Move
//
//  Created by Maryem W Ali on 8/2/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit

class MoveEventDisplay: UIViewController{
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var moveView: UIView!
    @IBOutlet weak var moveImage: UIImageView!
    @IBOutlet weak var moveTitle: UILabel!
    @IBOutlet weak var moveDescription: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBAction func shareButtonPressed(_ sender: Any) {
        let textToShare = ["Check out what I found to do in The Move!"]
        let shareActivityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        self.present(shareActivityViewController, animated: true, completion: nil)
 }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
