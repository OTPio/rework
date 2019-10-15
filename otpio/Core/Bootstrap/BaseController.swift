//
//  BaseController.swift
//  otpio
//
//  Created by Mason Phillips on 10/15/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import Eureka
import RxCocoa
import RxSwift

protocol BaseController {
    associatedtype T: BaseModel
    var model: T { get }
    var bag  : DisposeBag { get }
    
    var drawerButton: UIBarButtonItem { get }
    
    func openDrawer()
}

class BaseViewController<T: BaseModel>: UIViewController, BaseController {
    let model: T = T()
    let bag = DisposeBag()
    
    var drawerButton: UIBarButtonItem {
        let b = UIBarButtonItem(title: .fontAwesomeIcon(name: .bars), style: .plain, target: self, action: #selector(openDrawer))
        
        return b
    }
    
    @objc func openDrawer() {
        switch mm_drawerController.openSide {
        case .left, .right: mm_drawerController.closeDrawer(animated: true, completion: nil)
        default: break
        }
    }
}

class BaseFormController<T: BaseModel>: FormViewController, BaseController {
    let model: T = T()
    let bag = DisposeBag()
    
    var drawerButton: UIBarButtonItem {
        let b = UIBarButtonItem(title: .fontAwesomeIcon(name: .bars), style: .plain, target: self, action: #selector(openDrawer))
        
        return b
    }
    
    @objc func openDrawer() {
        switch mm_drawerController.openSide {
        case .left, .right: mm_drawerController.closeDrawer(animated: true, completion: nil)
        default: break
        }
    }
}
