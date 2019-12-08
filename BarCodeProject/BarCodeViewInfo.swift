//
//  BarCodeViewInfo.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit
import CoreData

class BarCodeViewInfo: UIViewController {
    
    var navigationName = "+"
    var stateNavigationEnter = true
    var dataForSwap = DataForSwap()
    var productInfo: ProductInfo!
    var spinner = UIActivityIndicatorView(style: .gray)
    var state = true
    
    let stack = CoreDataStack.shared
    let tableBarCodeView = TableBarCodeView()
    
    let labelPrice : UILabel = {
        let labelPrice = UILabel()
        labelPrice.layer.shadowRadius = 4
        labelPrice.layer.shadowOpacity = 0.5
        labelPrice.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelPrice.text = "label Price"
        labelPrice.textAlignment = .center
        labelPrice.numberOfLines = 3
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        return labelPrice
    }()
    
    let labelName : UILabel = {
        let labelName = UILabel()
        labelName.layer.shadowRadius = 4
        labelName.layer.shadowOpacity = 0.5
        labelName.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelName.text = "label name"
        labelName.textAlignment = .center
        labelName.numberOfLines = 3
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()
    
    let barCodeView : UIImageView = {
        let barCodeView = UIImageView()
        barCodeView.translatesAutoresizingMaskIntoConstraints = false
        return barCodeView
    }()
    
    // добавление продукта в корзину
    @objc func addFavorite() {
        if state == true {
            navigationItem.rightBarButtonItem?.isEnabled = false
            print("Hello")
            stack.persistentContainer.performBackgroundTask { (context) in
                let products = ModelData(context: context)
                products.name = self.productInfo.name
                products.price = self.productInfo.price
                
                if let url = URL(string: "https://img.napolke.ru/image/get?uuid=\(self.productInfo.images.first!)") {
                    if let data = try? Data(contentsOf: url) {
                        products.images = data
                    }
                }
                
                try! context.save()
                self.state = false
            }
            self.present(AlertAnswer.saveProduct.alert, animated: true, completion: nil)
        } 
    }
    
    // загрузка изображения
    func loadImage() {
        DispatchQueue.main.async {
            if let url = URL(string: "https://img.napolke.ru/image/get?uuid=\(self.productInfo.images.first!)") {
                if let data = try? Data(contentsOf: url) {
                    self.barCodeView.image = UIImage(data: data)
                }
            } else {
                self.barCodeView.image = UIImage(named: "imageNotFound")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        state = true
        
        navigationItem.rightBarButtonItem?.isEnabled = true
        navigationController?.navigationBar.barTintColor = .gray
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        if stateNavigationEnter == true {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: navigationName, style: .done, target: self, action: #selector(addFavorite))
            labelName.text = productInfo.name
            labelPrice.text = "Мин. цена: \(productInfo.price)"
            loadImage()
        }
        
        layOut()
        
        view.backgroundColor = .white
    }
    
    func layOut() {
        
        view.addSubview(spinner)
        
        spinner.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(labelName)
        
        labelName.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        labelName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(labelPrice)
        
        labelPrice.topAnchor.constraint(equalTo: view.topAnchor, constant: 480).isActive = true
        labelPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelPrice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(barCodeView)
        
        barCodeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        barCodeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        barCodeView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        barCodeView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
}
