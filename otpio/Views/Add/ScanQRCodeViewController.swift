//
//  ScanQRCodeViewController.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import AVFoundation
import RxSwift

class ScanQRCodeViewController: UIViewController {
    var model: AddModel!
    
    let bag = DisposeBag()
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    var qrFrame: UIView {
        let v = UIView()
        v.layer.borderColor = UIColor.green.cgColor
        v.layer.borderWidth = 2
        return v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.errorRelay.subscribe(onNext: handle).disposed(by: bag)
        model.validTokenReceivedRelay.skip(1).subscribe(onNext: validToken).disposed(by: bag)
        
        let discover = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: .video, position: .back)
        do {
            guard let inDevice = discover.devices.first else { throw CaptureError.cameraNotFound }
            let input = try AVCaptureDeviceInput(device: inDevice)
            captureSession.addInput(input)
        } catch {
            handle(error: error)
        }
        
        let meta = AVCaptureMetadataOutput()
        captureSession.addOutput(meta)
        meta.setMetadataObjectsDelegate(self, queue: .main)
        meta.metadataObjectTypes = [.qr]
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        
        view.addSubview(qrFrame)
        view.bringSubviewToFront(qrFrame)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !captureSession.isRunning { captureSession.startRunning() }
        navigationItem.title = "Scan QR Code"
        qrFrame.frame = .zero
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if captureSession.isRunning { captureSession.stopRunning() }
    }
    
    func validToken() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        navigationController?.popViewController(animated: true)
    }
    
    func handle(error: Error?) {
        let alert = UIAlertController(title: "Error",
                                      message: "An error occured\n\(error?.localizedDescription ?? "")",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { [alert] _ in
            alert.dismiss(animated: true, completion: nil)
        })
        
        present(alert, animated: true, completion: { [captureSession] in
            if !captureSession.isRunning { captureSession.startRunning() }
        })
    }
    
    enum CaptureError: Error {
        case cameraNotFound
    }
}

extension ScanQRCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            qrFrame.frame = .zero
            return
        }
        
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject, object.type == .qr {
            let frame = previewLayer.transformedMetadataObject(for: object)
            qrFrame.frame = frame?.bounds ?? .zero
            
            if let str = object.stringValue {
                captureSession.stopRunning()
                model.incomingToken.accept(URL(string: str))
            }
        }
    }
}
