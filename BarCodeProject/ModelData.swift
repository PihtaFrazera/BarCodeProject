//
//  ModelData.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 30/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import Foundation
import CoreData

@objc(ModelData)
internal class ModelData: NSManagedObject {
    
    @NSManaged var image: Data
    @NSManaged var name: String
    @NSManaged var price: Float
}
