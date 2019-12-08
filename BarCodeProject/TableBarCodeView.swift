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
    let dataForSwap = DataForSwap()
    let stack = CoreDataStack.shared
    let forCellReuseIdentifier = "cellid"
   
    
    private func updateLayout(with size: CGSize) {
        tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    // загрузка из контекста и заполнение даты
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

         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Удалить всю корзину", style: .done, target: self, action: #selector(clearDeepObjectEntity))
        
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

    // удаление корзины
    @objc func clearDeepObjectEntity() {
        dataForSwap.name.removeAll()
        dataForSwap.images.removeAll()
        dataForSwap.price.removeAll()
        
        let context = stack.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Object")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
        self.present(AlertAnswer.deleteAllProducts.alert, animated: true, completion: nil)
        tableView.reloadData()
    }
    
    // передача информацию в другой вью и показ данного вью
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let barCodeViewInfo = BarCodeViewInfo()
        
        barCodeViewInfo.labelName.text = dataForSwap.name[indexPath.row]
        barCodeViewInfo.labelPrice.text = String("\(dataForSwap.price[indexPath.row])p")
        barCodeViewInfo.barCodeView.image = UIImage(data: dataForSwap.images[indexPath.row])
        barCodeViewInfo.stateNavigationEnter = false
        
        
        self.navigationController?.pushViewController(barCodeViewInfo, animated: true)
    }

}

