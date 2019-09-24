//
//  ConfirmTokenViewController.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import FontAwesome_swift

class ConfirmTokenViewController: UIViewController {
    var model: AddModel!
    
    let descriptionLabel = UILabel()
    let codeLabel = UILabel()
    let timeLabel = UILabel()
    
    let bag = DisposeBag()
    
    let isTimeRelayActive = BehaviorRelay<Bool>(value: false)
    
    var doneButton: UIBarButtonItem {
        let b = FontAwesomeBarButtonItem(title: .fontAwesomeIcon(name: .check), style: .plain, target: self, action: #selector(done))
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .normal)
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .highlighted)
        return b
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)
        
        codeLabel.textAlignment = .center
        view.addSubview(codeLabel)
        
        timeLabel.textAlignment = .center
        view.addSubview(timeLabel)
        
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.title = "Confirm Code"
        
        if let token = model.preparedToken.value?.associatedToken {
            token.currentPassword.drive(codeLabel.rx.text).disposed(by: bag)
            token.timeLeft.drive(timeLabel.rx.text).disposed(by: bag)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isTimeRelayActive.accept(true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        isTimeRelayActive.accept(false)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        descriptionLabel.anchorToEdge(.top, padding: view.height * 0.3, width: view.width * 0.8, height: 150)
        view.groupAndAlign(group: .vertical, andAlign: .underCentered, views: [codeLabel, timeLabel], relativeTo: descriptionLabel, padding: 25, width: view.width * 0.8, height: 25)
    }
    
    @objc func done() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
