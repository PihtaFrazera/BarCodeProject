//
//  DataForSwap.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 01/12/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit
import CoreData

class DataForSwap: NSObject, UITableViewDataSource, UITableViewDelegate{

   // let stack = CoreDataStack.shared
    let forCellReuseIdentifier = "cellid"
    
    var name : [String] = []
    var price : [Float] = []
    var images : [Data] = []
    
//    func loafContext() {
//        let context = stack.persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Object")
//
//        request.returnsObjectsAsFaults = false
//
//        do {
//            let result = try context.fetch(request)
//            for data in result as! [ModelData] {
//                name.append(data.value(forKey: "name") as! String)
//                price.append(data.value(forKey: "price") as! Float)
//            }
//
//        } catch {
//
//            print("Failed")
//        }
//
//    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: forCellReuseIdentifier, for: indexPath) as! TableViewCell
        cell.imageView?.image = UIImage(data: images[indexPath.row])
        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = String("\(price[indexPath.row])p")
        
        return cell
    }
}
