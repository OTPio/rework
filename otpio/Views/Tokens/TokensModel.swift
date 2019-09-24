//
//  TokensModel.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TokensModel: BaseModel {
    let tokenManager: TokenManager = .shared
    
    let tokens: BehaviorRelay<[ExtendedToken]>
    
    required init() {
        tokens = BehaviorRelay(value: tokenManager.fetchAll())
        
        super.init()
    }
}
