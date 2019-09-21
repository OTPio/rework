//
//  AddViewController.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import FontAwesome_swift
import Eureka
import LibToken

class AddViewController: BaseFormController<AddModel> {
    
    var cameraButton: UIBarButtonItem {
        let b = FontAwesomeBarButtonItem(title: .fontAwesomeIcon(name: .cameraRetro), style: .plain, target: self, action: #selector(showCamera))
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .normal)
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .highlighted)
        return b
    }
    var saveButton: UIBarButtonItem {
        let b = FontAwesomeBarButtonItem(title: .fontAwesomeIcon(name: .check), style: .plain, target: self, action: #selector(showSave))
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .normal)
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .highlighted)
        return b
    }
    
    lazy var camera = ScanQRCodeViewController()
    lazy var save   = ConfirmTokenViewController()
    
    private let advancedCondition: Condition = Condition.function([CellTag.advanced.rawValue]) { form in
        return !((form.rowBy(tag: .advanced) as? SwitchRow)?.value ?? false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        camera.model = model
        save.model = model
        
        navigationItem.leftBarButtonItem = cameraButton
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.title = "Add Token"
        
        model.preparedToken.subscribe(onNext: { _ in self.navigationController?.pushViewController(self.save, animated: true) }).disposed(by: bag)
        
        form
            +++ Section(.secret)
                <<< TextRow(.secret)
            
            +++ Section(.details)
                <<< TextRow(.issuer)
                <<< TextRow(.name)
                <<< TextRow(.icon)
            
            +++ Section(.advanced)
                <<< SwitchRow(.advanced)
                <<< SegmentedRow<String>(.type) { row in
                    row.options = ["Time-based", "Counter-based"]
                    row.value = "Time-based"
                    row.hidden = self.advancedCondition
                }
                <<< ActionSheetRow<TokenAlgorithm>(.algorithm) { row in
                    row.options = TokenAlgorithm.allCases
                    row.value = .sha1
                    row.hidden = self.advancedCondition
                }
                <<< StepperRow(.digits) { row in
                    row.value = 6
                    row.hidden = self.advancedCondition
                }
                <<< StepperRow(.period) { row in
                    row.value = 30
                    row.hidden = self.advancedCondition
                }
        
            +++ Section(.storage)
                <<< SwitchRow(.inCloud)
                <<< SwitchRow(.inToday)
        
        bindRows()
    }
    
    func bindRows() {
        model.outSecret.drive((form.rowBy(tag: .secret) as? TextRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .secret) as? TextRow)!.rx.getValue.drive(model.inSecret).disposed(by: bag)
        
        model.outIssuer.drive((form.rowBy(tag: .issuer) as? TextRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .issuer) as? TextRow)!.rx.getValue.drive(model.inIssuer).disposed(by: bag)
        
        model.outLabel.drive((form.rowBy(tag: .name) as? TextRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .name) as? TextRow)!.rx.getValue.drive(model.inLabel).disposed(by: bag)
        
        model.outIcon.drive((form.rowBy(tag: .icon) as? TextRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .icon) as? TextRow)!.rx.getValue.drive(model.inIcon).disposed(by: bag)
        
        model.outType.drive((form.rowBy(tag: .type) as? SegmentedRow<String>)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .type) as? SegmentedRow<String>)!.rx.getValue.drive(model.inType).disposed(by: bag)
        
        model.outAlgorithm.drive((form.rowBy(tag: .algorithm) as? ActionSheetRow<TokenAlgorithm>)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .algorithm) as? ActionSheetRow<TokenAlgorithm>)!.rx.getValue.drive(model.inAlgorithm).disposed(by: bag)
        
        model.outDigits.drive((form.rowBy(tag: .digits) as? StepperRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .digits) as? StepperRow)!.rx.getValue.drive(model.inDigits).disposed(by: bag)
        
        model.outPeriod.drive((form.rowBy(tag: .period) as? StepperRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .period) as? StepperRow)!.rx.getValue.drive(model.inPeriod).disposed(by: bag)
        
        model.outCloud.drive((form.rowBy(tag: .inCloud) as? SwitchRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .inCloud) as? SwitchRow)!.rx.getValue.drive(model.inCloud).disposed(by: bag)
        
        model.outToday.drive((form.rowBy(tag: .inToday) as? SwitchRow)!.rx.setValue).disposed(by: bag)
        (form.rowBy(tag: .inToday) as? SwitchRow)!.rx.getValue.drive(model.inCloud).disposed(by: bag)
    }
    
    @objc func showCamera() {
        navigationController?.pushViewController(camera, animated: true)
    }
    @objc func showSave() {
        do {
            try model.prepareToken()
        } catch { handle(error: error) }
    }
}
