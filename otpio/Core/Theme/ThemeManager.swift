//
//  ThemeManager.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ThemeManager {
    static let shared: ThemeManager = ThemeManager()
    
    let currentCellStyle: BehaviorRelay<TokenCellStyle>
    let currentTheme    : BehaviorRelay<Theme>
    
    let bag = DisposeBag()
    
    init() {
        currentCellStyle = BehaviorRelay(value: TokenCellStyle.default)
        currentTheme = BehaviorRelay(value: Theme.default)
        
        currentTheme.subscribe(onNext: handleGlobalUpdate).disposed(by: bag)
    }
    
    private func handleGlobalUpdate(theme: Theme) {
        UINavigationBar.appearance().barTintColor = theme.theme.navbarBackground
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: theme.theme.navbarTitleColor]
    }
}
