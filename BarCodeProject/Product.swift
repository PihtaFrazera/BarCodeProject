//
//  Product.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import Foundation

struct Product: Decodable {
    var images: [String]
    var name: String
    var price: Float
}
