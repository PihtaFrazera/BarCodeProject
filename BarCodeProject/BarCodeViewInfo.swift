//
//  BarCodeViewInfo.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit

class BarCodeViewInfo: UIViewController {

    let labelName : UILabel = {
        let labelName = UILabel()
        labelName.layer.shadowColor = UIColor.magenta.cgColor
        labelName.layer.shadowRadius = 4
        labelName.layer.shadowOpacity = 0.5
        labelName.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelName.text = "label name"
        labelName.numberOfLines = 3
        labelName.frame = CGRect(x: 0, y: 380, width: 550.0, height: 40.0)
        return labelName
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        view.addSubview(labelName)
        view.backgroundColor = .red
        
    }
}
