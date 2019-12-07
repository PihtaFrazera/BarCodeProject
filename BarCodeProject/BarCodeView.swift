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
    
    let dataForSwap = DataForSwap()
    
    var cameraState = true
    let api = API()
    
    private var barCodeReader: BarCodeReaderProtocol = BarCodeReader()
    
    private func requestCameraAccess() {
        AVCaptureDevice.requestAccess(for: .video) { (access) in
            if !access {
              print("fdfddf")
            }
        }
    }
    
    let actionButton : UIButton = {
        let actionButton = UIButton(type: .custom)
        actionButton.setTitle("BarCode", for: .normal)
        actionButton.backgroundColor = .gray
        actionButton.layer.shadowRadius = 4
        actionButton.layer.shadowOpacity = 0.5
        actionButton.layer.shadowOffset = CGSize(width: -3, height: -4)
        actionButton.setTitleColor(UIColor.white, for: .normal)
        actionButton.addTarget(self, action:  #selector(tapButton), for:.touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        return actionButton
    }()
    
    let labelInfo : UILabel = {
        let labelInfo = UILabel()
        labelInfo.layer.shadowRadius = 4
        labelInfo.layer.shadowOpacity = 0.5
        labelInfo.layer.shadowOffset = CGSize(width: -3, height: -4)
        labelInfo.textColor = .white
        labelInfo.text = "Отсканируйте штрих код"
        labelInfo.textAlignment = .center
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        return labelInfo
    }()
    
    let scanView : UIView = {
        let scanView = UIView(frame: CGRect(x: 60, y: 200, width: 200, height: 200))
        return scanView
    }()
    
    let borderView : UIView = {
        let borderView = UIView(frame: CGRect(x: 60, y: 200, width: 200, height: 200))
        borderView.layer.borderColor = UIColor.white.cgColor
        borderView.layer.borderWidth = 5
        
        return borderView
    }()

override func viewDidLoad() {
    super.viewDidLoad()
     
     view.backgroundColor = .lightGray
     navigationController?.navigationBar.barTintColor = .gray
    
     barCodeReader.delegate = self
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        cameraState = true
        
        requestCameraAccess()
        view.addSubview(borderView)
        view.addSubview(labelInfo)
        labelInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(actionButton)
        actionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        view.addSubview(scanView)
        view.bringSubviewToFront(borderView)
       // barCodeReader.startRecord(in: scanView)
  
}
    
    @objc func tapButton() {
        if cameraState == true {
            cameraState = false
            barCodeReader.startRecord(in: scanView)
            UIView.animate(withDuration: 1, animations: {
                 self.scanView.alpha = 1
            })
        }
        else {
            cameraState = true
            barCodeReader.stopRecord()
            UIView.animate(withDuration: 1, animations: {
                     self.scanView.alpha = 0
            })
        }
    }

    func productList(at BarCode: String) {
        api.getProductInfo(at: BarCode, getInfo: { (productList) in
            if productList.products.isEmpty {
                self.present(AlertAnswer.productNotFound.alert, animated: true, completion: nil)
                self.cameraState = true
            } else {
                guard let firstProduct = productList.products.first else { return }
                DispatchQueue.main.async {
                    print(firstProduct.price)
                    print(firstProduct.name)
                    print(firstProduct.images)
                    self.pushViewController(firstProduct: firstProduct)
                    
                }
            }
        }) { (error) in
            self.present(AlertAnswer.otherProblem.alert, animated: true, completion: nil)
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
    
}
