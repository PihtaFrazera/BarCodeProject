//
//  BarCodeViewInfo.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit

class BarCodeViewInfo: UIViewController {

    var productInfo: ProductInfo!
    
    let labelName : UILabel = {
        let labelName = UILabel()
        labelName.layer.shadowRadius = 4
        labelName.layer.shadowOpacity = 0.5
        labelName.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelName.text = "label"
        labelName.numberOfLines = 3
        labelName.frame = CGRect(x: 0, y: 180, width: 550.0, height: 40.0)
        return labelName
    }()
    
    let labelPrice : UILabel = {
        let labelPrice = UILabel()
        labelPrice.layer.shadowRadius = 4
        labelPrice.layer.shadowOpacity = 0.5
        labelPrice.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelPrice.text = "label Price"
        labelPrice.numberOfLines = 3
        labelPrice.frame = CGRect(x: 0, y: 380, width: 550.0, height: 40.0)
        return labelPrice
    }()
    
    let labelNameName : UILabel = {
        let labelNameName = UILabel()
        labelNameName.layer.shadowRadius = 4
        labelNameName.layer.shadowOpacity = 0.5
        labelNameName.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelNameName.text = "label name name"
        labelNameName.numberOfLines = 3
        labelNameName.frame = CGRect(x: 0, y: 280, width: 550.0, height: 40.0)
        return labelNameName
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        view.addSubview(labelName)
        view.addSubview(labelNameName)
        view.addSubview(labelPrice)
        view.backgroundColor = .white
        
    }
}
