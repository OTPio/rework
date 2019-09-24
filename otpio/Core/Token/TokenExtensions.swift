//
//  TokenExtensions.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import LibToken
import RxSwift
import RxCocoa

extension Token {
//    var tokenInUse: BehaviorRelay<Bool> {
//        return BehaviorRelay<Bool>.init(value: false)
//    }
    var currentPassword: Driver<String> {
        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.asyncInstance)
        .map { _ in self.password(format: true) }
        .asDriver(onErrorJustReturn: String(repeating: "0", count: self.generator.digits))
    }
    var timeLeft: Driver<String> {
        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.asyncInstance)
        .compactMap { _ in self.timeRemaining() }
        .map { "\(Int($0))s" }
        .asDriver(onErrorJustReturn: "0s")
    }
}
