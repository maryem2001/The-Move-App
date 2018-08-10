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
    @IBOutlet weak var moveImageView: UIImageView!
    

    
    @IBOutlet weak var moveTitle: UILabel!
    var venueID = String()
    
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
        
        getData {
            self.getImage(venueid: self.venueID)
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
                let number = Int(arc4random_uniform(9))
    


    func getData(completion: @escaping () -> Void) {
        view.setGradiantBackground(colorOne:UIColor(red: 0.0/225.0, green:181.0/225.0, blue: 245.0/225.0, alpha: 1.0), colorTwo:UIColor(red: 119.0/225.0, green:28.0/225.0, blue: 250.0/225.0, alpha:1.0))
        let url = "https://api.foursquare.com/v2/venues/search"

        sendRequest(url, parameters: ["client_id":"NPURXZD5UHU41GBJENB5T0MGY5JAWNBU5J0OGBGRZKMTRH4W", "client_secret":"EC4DQKQROMEQJTQGYCY204DN2YEQMJARL5XPOVWWK2NTN3CN", "v":"20180323", "ll":"40.7243,-74.0018", "query":"\(Common.Global.moveType)", "limit":"10"])
            {
                responseObject, error in
            guard let responseObject = responseObject, error == nil else {
                print(error ?? "Unknown error")
                return
            }
             
           
            let number = Int(arc4random_uniform(9))

            let data = JSON(responseObject)

            let moveName = data["response"]["venues"][number]["name"]
               let venue  = data["response"]["venues"][number]["id"].stringValue
                self.venueID = venue
                let prefix = data["response"]["venues"][number]["categories"][0]["icon"]["prefix"].stringValue
                
                completion()
                
                
              
            
//                let moveImage = data["response"]["venues"]["photos"][number]["groups"]["items"]["source"]["url"]
//                print(moveImage)

                
                DispatchQueue.main.async {
                self.moveTitle.text = "\(moveName)"
//
                    
            }
        }
    }
    
    func bestGetImageFunction(){
        
         let photoUrl = "https://api.foursquare.com/v2/venues/VENUE_ID/photos"
        let  parameters = ["client_id":"NPURXZD5UHU41GBJENB5T0MGY5JAWNBU5J0OGBGRZKMTRH4W", "client_secret":"EC4DQKQROMEQJTQGYCY204DN2YEQMJARL5XPOVWWK2NTN3CN","VENUE_ID": self.venueID, "group":"venue", "limit":"10", "offset":"10","v":"20180323"]
        
        var components = URLComponents(string: photoUrl)!
        
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
                   
                    return
            }
            
            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            let json = JSON(responseObject)
            
        }
        task.resume()
        
        
    }
    
    func getImage(venueid: String) {
        let photoUrl = "https://api.foursquare.com/v2/venues/\(venueid)/photos"
        sendRequest(photoUrl, parameters: ["client_id":"NPURXZD5UHU41GBJENB5T0MGY5JAWNBU5J0OGBGRZKMTRH4W", "client_secret":"EC4DQKQROMEQJTQGYCY204DN2YEQMJARL5XPOVWWK2NTN3CN", "group":"venue", "limit":"10", "offset":"10","v":"20180323"])
        {
            responseObject, error in
            guard let responseObject = responseObject, error == nil else {
                print(error ?? "Unknown error")
                return
            }
        let data = JSON(responseObject)
         let prefix = data["response"]["photos"]["items"][0]["prefix"].stringValue
        let  suffix = data["response"]["photos"]["items"][0]["suffix"].stringValue
        let  width = data["response"]["photos"]["items"][0]["width"].stringValue
        let  height = data["response"]["photos"]["items"][0]["height"].stringValue
        
            do{
            let imageURL = "\(prefix)\(width)x\(height)\(suffix)"
            let imagedata = try Data(contentsOf: URL(string: imageURL)!)
            let image = UIImage(data: imagedata)
           
         
          
        
        DispatchQueue.main.async {
            //self.moveImageView.image = UIImage(named: moveImage[1])
             self.moveImageView.image = image!
            
        }
        }
            catch{
                print("bummerrr")
            }
    }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        getData {
            self.getImage(venueid: self.venueID)
        }
    
    }
    

}
