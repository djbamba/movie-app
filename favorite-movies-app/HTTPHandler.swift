//
//  HTTPHandler.swift
//  favorite-movies-app
//
//  Created by DJ Bamba on 12/8/17.
//
//

import Foundation

class HTTPHandler {
  
  static func getJson(urlString: String, completionHandler: @escaping (Data?) -> (Void)) {
    let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    let url = URL(string:urlString!)
    
    print("URL : \(url!)")
    let session = URLSession.shared
    let task = session.dataTask(with: url!) {
      data, response, error
      in
      if let data = data {
        let httpResponse = response as! HTTPURLResponse
        let statusCode = httpResponse.statusCode
        print("Request completed. Status Code: \(statusCode)")
        if statusCode == 200 {
          print("Returning to completion handler with data")
          completionHandler(data as Data)
        }
      } else if let error = error {
        print("*** Error occurred during HTTP Request")
        print(error.localizedDescription)
        completionHandler(nil)
      }
    }
    task.resume()
  }
}
