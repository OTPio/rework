//
//  TokenCellModel.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import FontAwesome_swift

class TokenCellModel: BaseModel {
    let token = BehaviorRelay<ExtendedToken?>(value: nil)
    
    required init() {
        super.init()
        
    }
}

extension TokenCellModel {
    var tokenId: Driver<String?> {
        return token.asDriver()
        .map { $0?.id }.map { String($0 ?? 0) }
    }
    var tokenIssuer: Driver<String?> {
        return token.asDriver()
        .map { $0?.associatedToken?.issuer }
    }
    var tokenLabel: Driver<String?> {
        return token.asDriver()
        .map { $0?.associatedToken?.label }
    }
    var tokenIcon: Driver<FontAwesome?> {
        return token.asDriver()
        .map { $0?.faIcon }
    }
    
    var tokenPassword: Driver<String> {
        return token.compactMap { $0?.associatedToken }
        .flatMap { $0.currentPassword.asObservable() }
        .asDriver(onErrorJustReturn: "")
    }
    var tokenTimeRemaining: Driver<String> {
        return token.compactMap { $0?.associatedToken }
        .flatMap { $0.timeLeft.asObservable() }
        .asDriver(onErrorJustReturn: "")
    }
}
