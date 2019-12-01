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
    // Core data propert
    let stack = CoreDataStack.shared
    var state = true

    var productInfo: ProductInfo!
    let tableBarCodeView = TableBarCodeView()
  
    
    let labelPrice : UILabel = {
        let labelPrice = UILabel()
        labelPrice.layer.shadowRadius = 4
        labelPrice.layer.shadowOpacity = 0.5
        labelPrice.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelPrice.text = "label Price"
        labelPrice.textAlignment = .center
        labelPrice.numberOfLines = 3
        labelPrice.frame = CGRect(x: 25, y: 480, width: 250.0, height: 40.0)
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
        labelName.frame = CGRect(x: 25, y: 380, width: 250.0, height: 80.0)
        return labelName
    }()
    
    let barCodeView : UIImageView = {
        let barCodeView = UIImageView(frame: CGRect(x: 50, y: 120, width: 250, height: 250))
        
        return barCodeView
    }()
    
    @objc func addFavorite() {
        if state == true {
            print("Hello")
            stack.persistentContainer.performBackgroundTask { (context) in
                let animal = ModelData(context: context)
                animal.name = self.productInfo.name
                animal.price = self.productInfo.price
                
                try! context.save()
                self.state = false
            }
        } 
    }

    func loadImage() {
        DispatchQueue.main.async {
            if let url = URL(string: "https://img.napolke.ru/image/get?uuid=\(self.productInfo.images.first!)") {
                if let data = try? Data(contentsOf: url) {
                    self.barCodeView.image = UIImage(data: data)
                }
            }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state = true
        navigationController?.navigationBar.barTintColor = .gray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addFavorite))
        
        labelName.text = productInfo.name
        labelPrice.text = "Мин. цена: \(productInfo.price)"
    
        loadImage()
        print(productInfo.images.first!)

        view.addSubview(labelName)
        view.addSubview(labelPrice)
        view.addSubview(barCodeView)
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    //    loafContext()
        
    }
}
