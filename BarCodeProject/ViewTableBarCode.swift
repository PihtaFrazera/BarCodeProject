//
//  ViewTableBarCode.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 01/12/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit
import CoreData

class ViewTableBarCode: UIViewController, UITableViewDelegate {
    
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
    
    
    override func viewDidLoad() {
        layOut()
        
        view.backgroundColor = .lightGray
        navigationController?.navigationBar.barTintColor = .gray
        
    }
    
    func layOut() {
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
