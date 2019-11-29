//
//  ProductList.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 29/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import Foundation

struct ProductList: Decodable {
    let products: [ProductInfo]
    
    enum CodingKeys: String, CodingKey {
        case products = "data"
    }
}
