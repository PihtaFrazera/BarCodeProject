//
//  TableBarCodeView.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 30/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit
import CoreData

class TableBarCodeView: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let viewTableBarCode = ViewTableBarCode()
    
    let stack = CoreDataStack.shared
    let forCellReuseIdentifier = "cellid"
    
    var name : [String] = []
    var price : [Float] = []
    
    
    func loafContext() {
        let context = stack.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Object")

        request.returnsObjectsAsFaults = false

        do {
            let result = try context.fetch(request)
            for data in result as! [ModelData] {
               name.append(data.value(forKey: "name") as! String)
               price.append(data.value(forKey: "price") as! Float)
            }

        } catch {

            print("Failed")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       

     //   print(text)
        tableView.dataSource = self
        tableView.delegate = self
     //   viewTableBarCode..delegate = self
        loafContext()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: forCellReuseIdentifier)
        tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: forCellReuseIdentifier, for: indexPath) as! TableViewCell
        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = String("\(price[indexPath.row])p")
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewTableBarCode.labelName.text = name[indexPath.row]
        viewTableBarCode.labelPrice.text = String("\(price[indexPath.row])p")
         self.navigationController?.pushViewController(viewTableBarCode, animated: true)
    }
}