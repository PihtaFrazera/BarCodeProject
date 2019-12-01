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
    
    
    override func viewDidLoad() {
        
   //     labelName.text = productInfo.name
   //     labelPrice.text =  Мин. цена: \(productInfo.price)"
    
        
        view.addSubview(labelName)
        view.addSubview(labelPrice)
        view.addSubview(barCodeView)
        view.backgroundColor = .white
    }
}
