//
//  BaseModel.swift
//  otpio
//
//  Created by Mason Phillips on 10/15/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class BaseModel {
    
    let theme : ThemeManager = .shared
    let router: Router       = .shared
    
    let bag = DisposeBag()
    
    required init() {
        
    }
}
