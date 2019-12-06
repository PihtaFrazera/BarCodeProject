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
        
        navigationController?.navigationBar.barTintColor = .gray
        updateLayout(with: view.frame.size)
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
        tableView.backgroundColor = .lightGray
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: forCellReuseIdentifier)
        tableView.dataSource = dataForSwap
        tableView.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(dataForSwap.name)
        loadContext()

        tableView.reloadData()
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewTableBarCode.labelName.text = dataForSwap.name[indexPath.row]
        viewTableBarCode.labelPrice.text = String("\(dataForSwap.price[indexPath.row])p")
        viewTableBarCode.barCodeView.image = UIImage(data: dataForSwap.images[indexPath.row])
        self.navigationController?.pushViewController(viewTableBarCode, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить", handler: { (action, IndexPath) in
            self.dataForSwap.name.remove(at: IndexPath.row)
            self.dataForSwap.price.remove(at: IndexPath.row)
            self.dataForSwap.images.remove(at: IndexPath.row)
            self.dataForSwap.indexPath = indexPath.row
            tableView.deleteRows(at: [IndexPath as IndexPath], with: .fade)
        })
        
        deleteAction.backgroundColor = UIColor.gray
        
        return [deleteAction]
    }

}

