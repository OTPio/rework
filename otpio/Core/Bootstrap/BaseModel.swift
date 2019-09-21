//
//  BaseModel.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData

class BaseModel {
    
    var container: NSPersistentCloudKitContainer?
    
    let errorRelay: BehaviorRelay<Error?>
    
    let bag: DisposeBag
    
    required init() {
        container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
        errorRelay = BehaviorRelay(value: nil)
        bag = DisposeBag()
    }
}
