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
    let barCodeViewInfo = BarCodeViewInfo()
    
    private var barCodeReader: BarCodeReaderProtocol = BarCodeReader()

    
    private func requestCameraAccess() {
        AVCaptureDevice.requestAccess(for: .video) { (access) in
            if !access {
              print("fdfddf")
            }
        }
    }

override func viewDidLoad() {
    super.viewDidLoad()
    
     navigationController?.navigationBar.barTintColor = .blue
    
     requestCameraAccess()
     barCodeReader.delegate = self

     barCodeReader.startRecord(in: view)
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         barCodeReader.startRecord(in: view)
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
                    self.barCodeViewInfo.labelNameName.text = firstProduct.name
                    self.barCodeViewInfo.labelPrice.text = String(firstProduct.price)
                }
            }
        }) { (APIError) in
            print("error")
        }
        
    }
    
    func getBarCode(BarCode: String) {
        
        barCodeReader.stopRecord()
        productList(at: BarCode)
        self.navigationController?.pushViewController(barCodeViewInfo, animated: true)
        
    }
    
    func showError() {
        // present ErrorAllert BarCode
    }
}
