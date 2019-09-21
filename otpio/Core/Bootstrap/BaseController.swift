//
//  BaseController.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import RxSwift
import Eureka

class BaseController<T: BaseModel>: UIViewController {
    let model: T
    
    let bag = DisposeBag()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        model = T()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        model.errorRelay.subscribe(onNext: handle).disposed(by: bag)
    }
    
    func handle(error: Error?) {
        let alert = UIAlertController(title: "Error",
                                      message: "An error occured\n\(error?.localizedDescription ?? "")",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { [alert] _ in
            alert.dismiss(animated: true, completion: nil)
        })
        
        present(alert, animated: true, completion: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class BaseFormController<T: BaseModel>: FormViewController {
    let model: T
    
    let bag = DisposeBag()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        model = T()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        model.errorRelay.subscribe(onNext: handle).disposed(by: bag)
    }
    
    func handle(error: Error?) {
        let alert = UIAlertController(title: "Error",
                                      message: "An error occured\n\(error?.localizedDescription ?? "")",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { [alert] _ in
            alert.dismiss(animated: true, completion: nil)
        })
        
        present(alert, animated: true, completion: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
