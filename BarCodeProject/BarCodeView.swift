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

override func viewDidLoad() {
    super.viewDidLoad()
    
     navigationController?.navigationBar.barTintColor = .blue
    
     api.getProductInfo(at: "46141538")
     requestCameraAccess()
     barCodeReader.delegate = self

     barCodeReader.startRecord(in: view)
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         barCodeReader.startRecord(in: view)
}

    func getBarCode(BarCode: String) {
        let barCodeViewInfo = BarCodeViewInfo()
        barCodeViewInfo.labelName.text = BarCode
        
        barCodeReader.stopRecord()
        self.navigationController?.pushViewController(barCodeViewInfo, animated: true)
        // apiProductList (at: BarCode)
        
    }
    
    func showError() {
        // present ErrorAllert BarCode
    }
}
