//
//  ViewController.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit
import AVFoundation

protocol BarCodeReaderDeleagte: class {
    func getBarCode(BarCode: String)
    func showError()
}

protocol BarCodeReaderProtocol {
    var delegate: BarCodeReaderDeleagte? { get set }
    
    func startRecord(in view: UIView)
    func stopRecord()
}

class BarCodeReader: NSObject, AVCaptureMetadataOutputObjectsDelegate, BarCodeReaderProtocol {
    

    var delegate: BarCodeReaderDeleagte?
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    
    func startRecord(in view: UIView) {
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [.ean8,
                                                         .ean13,
                                                         .pdf417,
                                                         .code128,
                                                         .code39]
            
            let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer.connection?.videoOrientation = .portrait
            
            self.videoPreviewLayer = videoPreviewLayer
            
            videoPreviewLayer.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer)
            
            
             DispatchQueue.global(qos: .userInitiated).async {
                self.captureSession?.startRunning()
            }
            
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 3
                
                view.addSubview(qrCodeFrameView)
                
            }
        } catch {
            print(error)
            return
        }
    }
       
    
    func stopRecord() {
        captureSession?.stopRunning()
        videoPreviewLayer?.removeFromSuperlayer()
        qrCodeFrameView?.removeFromSuperview()

    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        guard !metadataObjects.isEmpty,
            let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
            let BarCode = object.stringValue else {
                return
        }
        
        let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: object)
        qrCodeFrameView?.frame = barCodeObject!.bounds
        
        print(BarCode)
        print(object.type)
        delegate?.getBarCode(BarCode: BarCode)
        stopRecord()
//        captureSession?.stopRunning()
//        videoPreviewLayer?.removeFromSuperlayer()
//        qrCodeFrameView?.removeFromSuperview()
    
    }

}

