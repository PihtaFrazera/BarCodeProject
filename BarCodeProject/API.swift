//
//  API.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import Foundation

class API {
    let region = "0c5b2444-70a0-4932-980c-b4dc0d3f02b5"
    func getProductInfo(at BarCode: String, getInfo: ((ProductList) -> Void)?, fail: @escaping (AlertAnswer?) -> Void?) {
    let url = URL(string: "https://catalog.napolke.ru/search/catalog")!
   
    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    // в текст передается штрих код в регион забит регион Москвы согласно ФИАС
    request.httpBody = try? JSONSerialization.data(withJSONObject: ["text": BarCode, "region": [region, nil, nil]] as [String : Any], options: .prettyPrinted)

    let session = URLSession.shared
    session.dataTask(with: request) { data, response, error in
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
            let jsonData = data else {
                fail(.responseProblem)
                return
        }
        do {
            let messageData = try JSONDecoder().decode(ProductList.self, from: jsonData)
            getInfo?(messageData)
        } catch {
            fail(.decodingProblem)
        }
        }.resume()
    }
}
