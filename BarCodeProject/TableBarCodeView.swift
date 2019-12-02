//
//  TableBarCodeView.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 30/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit
import CoreData

class TableBarCodeView: UIViewController, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    let tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
    let viewTableBarCode = ViewTableBarCode()
    let dataForSwap = DataForSwap()
    let stack = CoreDataStack.shared
    let forCellReuseIdentifier = "cellid"
//    
//    var name : [String] = []
//    var price : [Float] = []
    
    private func updateLayout(with size: CGSize) {
        tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    func loadContext() {
        dataForSwap.name.removeAll()
        dataForSwap.images.removeAll()
        dataForSwap.price.removeAll()
        let context = stack.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Object")

        request.returnsObjectsAsFaults = false

        do {
            let result = try context.fetch(request)
            for data in result as! [ModelData] {
              dataForSwap.name.append(data.value(forKey: "name") as! String)
              dataForSwap.price.append(data.value(forKey: "price") as! Float)
              dataForSwap.images.append(data.value(forKey: "images") as! Data)
            }
        } catch {
            print("Failed")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLayout(with: view.frame.size)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: forCellReuseIdentifier)
        tableView.dataSource = dataForSwap
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(dataForSwap.name)
        loadContext()

        view.addSubview(tableView)
        tableView.reloadData()
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewTableBarCode.labelName.text = dataForSwap.name[indexPath.row]
        viewTableBarCode.labelPrice.text = String("\(dataForSwap.price[indexPath.row])p")
        viewTableBarCode.barCodeView.image = UIImage(data: dataForSwap.images[indexPath.row])
        self.navigationController?.pushViewController(viewTableBarCode, animated: true)
    }
}
