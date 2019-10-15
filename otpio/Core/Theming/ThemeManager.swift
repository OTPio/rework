//
//  ThemeManager.swift
//  otpio
//
//  Created by Mason Phillips on 10/15/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ThemeManager {
    static let shared: ThemeManager = ThemeManager()
    
    let theme: BehaviorRelay<Theme> = BehaviorRelay<Theme>(value: .default)
    
    let bag = DisposeBag()
    
    init() {
        
    }
    
    func `switch`(to theme: Theme) {
        self.theme.accept(theme)
    }
}
