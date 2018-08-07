//
//  MoveEventDisplay.swift
//  The Move
//
//  Created by Maryem W Ali on 8/2/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import CoreLocation


class MoveEventDisplay: UIViewController{
    
//    func getData() {
//        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
//        let url = "https://api.foursquare.com/v2/venues/search"
//        //        let deviceLocation = CLLocation()
//
//        sendRequest(url, parameters: ["client_id":"NPURXZD5UHU41GBJENB5T0MGY5JAWNBU5J0OGBGRZKMTRH4W", "client_secret":"EC4DQKQROMEQJTQGYCY204DN2YEQMJARL5XPOVWWK2NTN3CN", "v":"20180323", "ll":"40.7243,-74.0018",  "query":"coffee", "limit":"10"]) { responseObject, error in
//            guard let responseObject = responseObject, error == nil else {
//                print(error ?? "Unknown error")
//                return
//            }
//            //            print(responseObject.count)
//            let number = arc4random_uniform(9)
//
//            let data = JSON(responseObject)
//
//            let response = data["response"]["venues"]["name"]
//            print(response)
//            //            let number = arc4random_uniform(9)
//            ////            print(number)
//
//            //            self.moveTitle.text = "\(response)" // assign your outlet here with what you got from the json response
//        }
//    }

    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var moveView: UIView!
    @IBOutlet weak var moveImage: UIImageView!
    @IBOutlet weak var moveTitle: UILabel!
//        self.moveTitle.text = "\(response)" // assign your outlet here with what you got from the json response
    
    
    @IBOutlet weak var moveDescription: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBAction func shareButtonPressed(_ sender: Any) {
        let textToShare = ["Check out what I found to do in The Move!"]
        let shareActivityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        self.present(shareActivityViewController, animated: true, completion: nil)
 }

    
    
    func sendRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode,
                error == nil else {
                    completion(nil, error)
                    return
            }
            
            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            completion(responseObject, nil)
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getData() {
        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
        let url = "https://api.foursquare.com/v2/venues/search"
//        let deviceLocation = CLLocation()

        sendRequest(url, parameters: ["client_id":"NPURXZD5UHU41GBJENB5T0MGY5JAWNBU5J0OGBGRZKMTRH4W", "client_secret":"EC4DQKQROMEQJTQGYCY204DN2YEQMJARL5XPOVWWK2NTN3CN", "v":"20180323", "ll":"40.7243,-74.0018",  "query":"places", "limit":"100"]) { responseObject, error in
            guard let responseObject = responseObject, error == nil else {
                print(error ?? "Unknown error")
                return
            }
//            print(responseObject.count)
            let number = Int(arc4random_uniform(99))

            let data = JSON(responseObject)

            let moveName = data["response"]["venues"][number]["name"]
            print(moveName)
//            let number = arc4random_uniform(9)
////            print(number)
            DispatchQueue.main.async {
                self.moveTitle.text = "\(moveName)" // assign your outlet here with what you got from the json response
            }
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        getData()
    }
    
}
