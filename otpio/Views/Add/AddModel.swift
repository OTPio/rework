//
//  AddModel.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import LibToken

class AddModel: BaseModel {
    let incomingToken = BehaviorRelay<URL?>(value: nil)
    let preparedToken = BehaviorRelay<ExtendedToken?>(value: nil)
    let provisionalToken = BehaviorRelay<Token?>(value: nil)
    let provisionalExtendedToken = BehaviorRelay<ExtendedToken?>(value: nil)
    let validTokenReceivedRelay = BehaviorRelay<Void>(value: ())

    required init() {
        super.init()
        
        incomingToken
        .subscribe(onNext: { [provisionalToken, provisionalExtendedToken, validTokenReceivedRelay] url in
            do {
                let t = try Token(from: url)
                provisionalToken.accept(t)
                let e = ExtendedToken(context: self.container!.viewContext)
                provisionalExtendedToken.accept(e)
                validTokenReceivedRelay.accept(())
            } catch let e {
                self.errorRelay.accept(e)
            }
        }).disposed(by: bag)
        
        // prepare initial bindings
        outSecret.drive(inSecret).disposed(by: bag)
        outIssuer.drive(inIssuer).disposed(by: bag)
        outLabel.drive(inLabel).disposed(by: bag)
        outIcon.drive(inIcon).disposed(by: bag)
        outType.drive(inType).disposed(by: bag)
        outAlgorithm.drive(inAlgorithm).disposed(by: bag)
        outDigits.drive(inDigits).disposed(by: bag)
        outPeriod.drive(inPeriod).disposed(by: bag)
        outToday.drive(inToday).disposed(by: bag)
        outCloud.drive(inCloud).disposed(by: bag)
    }
    
    func prepareToken() throws {
        guard
            let secret = inSecret.value?.base32DecodedData,
            let issuer = inIssuer.value,
            let label = inLabel.value,
            let icon = inIcon.value,
            let type = inType.value,
            let algorithm = inAlgorithm.value,
            let digits = inDigits.value,
            let period = inPeriod.value,
            let today = inToday.value,
            let cloud = inCloud.value
            else { throw TokenValueError.missingValue }
        
        let ttype: Generator.TokenType = (type == "Time-based") ? .totp(period) : .hotp(UInt64(period))
        let generator = Generator(secret: secret, algorithm: algorithm, type: ttype, digits: Int(digits))
        let token = Token(label, issuer, generator)
        let e = TokenManager.shared.saveToken(token: token, today: today, cloud: cloud, icon: icon)
        preparedToken.accept(e)
    }
    
    // Token in/out
    var inSecret    = BehaviorRelay<String?>(value: nil)
    var inIssuer    = BehaviorRelay<String?>(value: nil)
    var inLabel     = BehaviorRelay<String?>(value: nil)
    var inIcon      = BehaviorRelay<String?>(value: nil)
    var inType      = BehaviorRelay<String?>(value: nil)
    var inAlgorithm = BehaviorRelay<TokenAlgorithm?>(value: nil)
    var inDigits    = BehaviorRelay<Double?>(value: nil)
    var inPeriod    = BehaviorRelay<Double?>(value: nil)
    var inToday     = BehaviorRelay<Bool?>(value: nil)
    var inCloud     = BehaviorRelay<Bool?>(value: nil)
    
    var outSecret: Driver<String> {
        return provisionalToken.compactMap { $0?.generator.secret.base32EncodedString }
        .asDriver(onErrorJustReturn: "")
    }
    var outIssuer: Driver<String> {
        return provisionalToken.compactMap { $0?.issuer }
        .asDriver(onErrorJustReturn: "")
    }
    var outLabel: Driver<String> {
        return provisionalToken.compactMap { $0?.label }
        .asDriver(onErrorJustReturn: "")
    }
    var outIcon: Driver<String> {
        return provisionalExtendedToken.compactMap { $0?.icon }
        .asDriver(onErrorJustReturn: "")
    }
    var outType: Driver<String> {
        return provisionalToken.compactMap { $0?.generator.type }
        .map { t -> String in
            switch t {
            case .totp(_): return "Time-based"
            case .hotp(_): return "Counter-based"
            }
        }
        .asDriver(onErrorJustReturn: "Time-based")
    }
    var outAlgorithm: Driver<TokenAlgorithm> {
        return provisionalToken.compactMap { $0?.generator.algorithm }
        .asDriver(onErrorJustReturn: .sha1)
    }
    var outDigits: Driver<Double> {
        return provisionalToken.compactMap { $0?.generator.digits }
        .map { Double($0) }
        .asDriver(onErrorJustReturn: 0.0)
    }
    var outPeriod: Driver<Double> {
        return provisionalToken.compactMap { $0?.generator.type }
        .map { t -> Double in
            switch t {
            case .totp(let p): return p
            case .hotp(let c): return Double(c)
            }
        }
        .asDriver(onErrorJustReturn: 0.0)
    }
    var outCloud: Driver<Bool> {
        return provisionalExtendedToken.compactMap { $0?.cloud }
        .asDriver(onErrorJustReturn: false)
    }
    var outToday: Driver<Bool> {
        return provisionalExtendedToken.compactMap { $0?.today }
        .asDriver(onErrorJustReturn: false)
    }
}

enum TokenValueError: Error {
    case missingValue
}
