//
//  BarCodeView.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit
import AVFoundation

class BarCodeView: UIViewController, BarCodeReaderDeleagte {
    
    
    let api = API()
    
    private var barCodeReader: BarCodeReaderProtocol = BarCodeReader()
    
    private func requestCameraAccess() {
        AVCaptureDevice.requestAccess(for: .video) { (access) in
            if !access {
              print("fdfddf")
            }
        }
    }
    
    let labelInfo : UILabel = {
        let labelInfo = UILabel()
        labelInfo.layer.shadowRadius = 4
        labelInfo.layer.shadowOpacity = 0.5
        labelInfo.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelInfo.textColor = .white
        labelInfo.text = "Отсканируйте штрих код"
        labelInfo.textAlignment = .center
        labelInfo.frame = CGRect(x: 38, y: 100, width: 250.0, height: 40.0)
        return labelInfo
    }()
    
    let scanView : UIView = {
        let scanView = UIView(frame: CGRect(x: 60, y: 200, width: 200, height: 100))
        scanView.layer.cornerRadius = 10
        scanView.layer.borderColor = UIColor.white.cgColor
        scanView.layer.borderWidth = 3
        
        
        return scanView
    }()

override func viewDidLoad() {
    super.viewDidLoad()
    
     navigationController?.navigationBar.barTintColor = .gray
    
     requestCameraAccess()
     barCodeReader.delegate = self
    barCodeReader.startRecord(in: view)
     view.addSubview(scanView)
     view.addSubview(labelInfo)
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
}

    func productList(at BarCode: String) {
        api.getProductInfo(at: BarCode, getInfo: { (productList) in
            if productList.products.isEmpty {
                print("empty product list")
            } else {
                guard let firstProduct = productList.products.first else { return }
                DispatchQueue.main.async {
                    print(firstProduct.price)
                    print(firstProduct.name)
                    print(firstProduct.images)
                    self.pushViewController(firstProduct: firstProduct)
                    
                }
            }
        }) { (APIError) in
            print("error")
        }
        
    }
    
    func pushViewController(firstProduct: ProductInfo) {
        let barCodeViewInfo = BarCodeViewInfo()
        barCodeViewInfo.productInfo = firstProduct
        self.navigationController?.pushViewController(barCodeViewInfo, animated: true)
        
    }
    
    func getBarCode(BarCode: String) {
        barCodeReader.stopRecord()
        productList(at: BarCode)
    }
    
    func showError() {
        // present ErrorAllert BarCode
    }
}
