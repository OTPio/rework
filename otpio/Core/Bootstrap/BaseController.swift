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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThemeManager.shared.currentTheme.subscribe(onNext: handleUpdate).disposed(by: bag)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleUpdate(theme: ThemeManager.shared.currentTheme.value)
    }
    
    func handleUpdate(theme: Theme) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = theme.theme.secondaryBackground
            
            if let left = self.navigationItem.leftBarButtonItem {
                left.tintColor = theme.theme.navbarBarButtonColor
                self.navigationItem.leftBarButtonItem = left
            }
            if let right = self.navigationItem.rightBarButtonItem {
                right.tintColor = theme.theme.navbarBarButtonColor
                self.navigationItem.rightBarButtonItem = right
            }
            
            self.navigationController?.navigationBar.barTintColor = theme.theme.navbarBackground
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: theme.theme.navbarTitleColor]
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThemeManager.shared.currentTheme.subscribe(onNext: handleUpdate).disposed(by: bag)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleUpdate(theme: ThemeManager.shared.currentTheme.value)
    }
    
    func handleUpdate(theme: Theme) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = theme.theme.secondaryBackground
            self.tableView.backgroundColor = theme.theme.secondaryBackground
            
            if let left = self.navigationItem.leftBarButtonItem {
                left.tintColor = theme.theme.navbarBarButtonColor
                self.navigationItem.leftBarButtonItem = left
            }
            if let right = self.navigationItem.rightBarButtonItem {
                right.tintColor = theme.theme.navbarBarButtonColor
                self.navigationItem.rightBarButtonItem = right
            }
            
            self.navigationController?.navigationBar.barTintColor = theme.theme.navbarBackground
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: theme.theme.navbarTitleColor]
        }
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
