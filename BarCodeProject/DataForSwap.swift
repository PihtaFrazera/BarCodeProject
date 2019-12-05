//
//  DataForSwap.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 01/12/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit

class DataForSwap: NSObject, UITableViewDataSource, UITableViewDelegate{

    let forCellReuseIdentifier = "cellid"
    
    var name : [String] = []
    var price : [Float] = []
    var images : [Data] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: forCellReuseIdentifier, for: indexPath) as! TableViewCell
        cell.backgroundColor = .lightGray
        cell.imageView?.image = UIImage(data: images[indexPath.row])
        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = String("\(price[indexPath.row])p")
        
        return cell
    }
}
