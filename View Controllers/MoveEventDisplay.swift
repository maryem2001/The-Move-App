//
//  MoveEventDisplay.swift
//  The Move
//
//  Created by Maryem W Ali on 8/2/18.
//  Copyright © 2018 Maryem W Ali. All rights reserved.
//

import Foundation
import UIKit
// import FoursquareAPIClient
// import Alamofire
import SwiftyJSON


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

    
    
    func sendRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,                            // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                error == nil else {                           // was there no error, otherwise ...
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
        view.setGradiantBackground(colorOne:UIColor(red: 89.0/225.0, green:38.0/225.0, blue: 197.0/225.0, alpha: 1.0), colorTwo: .red)
        let url = "https://api.foursquare.com/v2/venues/search"
    
        sendRequest(url, parameters: ["client_id":"NPURXZD5UHU41GBJENB5T0MGY5JAWNBU5J0OGBGRZKMTRH4W", "client_secret":"EC4DQKQROMEQJTQGYCY204DN2YEQMJARL5XPOVWWK2NTN3CN", "v":"20180323", "ll":"40.7243,-74.0018",  "query":"coffee", "limit":"10"]) { responseObject, error in
            guard let responseObject = responseObject, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            print(responseObject.count)
            let data = JSON(responseObject)
            print(data)
            
            // use `responseObject` here
        }    }
//        let client = FoursquareAPIClient(clientId: "NPURXZD5UHU41GBJENB5T0MGY5JAWNBU5J0OGBGRZKMTRH4W", clientSecret: "EC4DQKQROMEQJTQGYCY204DN2YEQMJARL5XPOVWWK2NTN3CN", version:"20180323")
//        let parameter: [String: String] = [
//            "ll": "40.7243,-74.0018",
//            "limit": "10",
//            ];
//
//        client.request(path: "v2/venues/explore", parameter: parameter) {
//            [weak self] result in
//
//            switch result {
//
//            case let .success(data):
//                // parse the JSON data with NSJSONSerialization or Lib like SwiftyJson
//                // let json = JSON(data: data) // e.g. {"meta":{"code":200},"notifications":[{"...
//                let json = data
//                print(data)
//
//            case let .failure(error):
//                // Error handling
//                switch error {
//                case let .connectionError(connectionError):
//                    print(connectionError)
//                case let .apiError(apiError):
//                    print(apiError.errorType)   // e.g. endpoint_error
//                    print(apiError.errorDetail) // e.g. The requested path does not exist.
//                case .responseParseError(_):
//                    print("Some error")
//                }
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
