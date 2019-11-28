//
//  API.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import Foundation

class API {
    func getProductInfo(at BarCode: String) {
    let url = URL(string: "https://catalog.napolke.ru/search/catalog")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = try? JSONSerialization.data(withJSONObject: ["text": BarCode, "region": "0c5b2444-70a0-4932-980c-b4dc0d3f02b5"] as [String : Any], options: .prettyPrinted)
        // httpBody(at: BarCode)
   
        
    let session = URLSession.shared
    session.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print("error")
            return
        }
            
        
    }.resume()
    }
    
    func getProductImage() {
        
    }
    
  
    
    
}
