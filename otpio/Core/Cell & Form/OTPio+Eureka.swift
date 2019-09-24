//
//  OTPio+Eureka.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import Eureka
import RxSwift
import RxCocoa
import LibToken

extension Form {
    func sectionBy(tag: SectionTagType) -> Section? {
        return self.sectionBy(tag: tag.rawValue)
    }
    func rowBy(tag: CellTagType) -> BaseRow? {
        return self.rowBy(tag: tag.rawValue)
    }
}

extension Section {
    convenience init(_ tag: SectionTagType) {
        self.init(header: tag.title, footer: tag.footer)
    }
}

extension TextRow: ReactiveCompatible {}
extension Reactive where Base: TextRow {
    // Values
    var setValue: Binder<String?> {
        return Binder<String?>(base) { t, v in
            t.value = v
            t.updateCell()
        }
    }
    var getValue: Driver<String?> {
        return Observable<String?>.create { [base] observer -> Disposable in
            base.onChange { observer.onNext($0.value) }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: "")
    }
}

extension TextRow {
    var cellTag: CellTagType? {
        return TokenCellTag(rawValue: self.tag ?? "")
    }
    convenience init(_ tag: CellTagType) {
        self.init(tag: tag.rawValue)
        self.title = tag.title
    }
    convenience init(_ tag: CellTagType, initializer: (TextRow) -> Void) {
        self.init(tag.rawValue, initializer)
        self.title = tag.title
    }
}

extension SwitchRow: ReactiveCompatible {}
extension Reactive where Base: SwitchRow {
    var setValue: Binder<Bool?> {
        return Binder<Bool?>(base) { t, v in
            t.value = v
            t.updateCell()
        }
    }
    var getValue: Driver<Bool?> {
        return Observable<Bool?>.create { [base] observer -> Disposable in
            base.onChange { observer.onNext($0.value) }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: false)
    }
}

extension SwitchRow {
    var cellTag: TokenCellTag? {
        return TokenCellTag(rawValue: self.tag ?? "")
    }
    convenience init(_ tag: CellTagType) {
        self.init(tag: tag.rawValue)
        self.title = tag.title
    }
    convenience init(_ tag: CellTagType, initializer: (SwitchRow) -> Void) {
        self.init(tag.rawValue, initializer)
        self.title = tag.title
    }
}


extension StepperRow: ReactiveCompatible {}
extension Reactive where Base: StepperRow {
    var setValue: Binder<Double?> {
        return Binder<Double?>(base) { t, v in
            t.value = v
            t.updateCell()
        }
    }
    var getValue: Driver<Double?> {
        return Observable<Double?>.create { [base] observer -> Disposable in
            base.onChange { observer.onNext($0.value) }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: 0.0)
    }
}

extension StepperRow {
    var cellTag: TokenCellTag? {
        return TokenCellTag(rawValue: self.tag ?? "")
    }
    convenience init(_ tag: CellTagType) {
        self.init(tag: tag.rawValue)
        self.title = tag.title
    }
    convenience init(_ tag: CellTagType, initializer: (StepperRow) -> Void) {
        self.init(tag.rawValue, initializer)
        self.title = tag.title
    }
}

extension SegmentedRow: ReactiveCompatible {}
extension Reactive where Base: SegmentedRow<String> {
    var setValue: Binder<String?> {
        return Binder<String?>(base) { t, v in
            t.value = v
            t.updateCell()
        }
    }
    var getValue: Driver<String?> {
        return Observable<String?>.create { [base] observer in
            base.onChange { observer.onNext($0.value) }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: nil)
    }
}

extension SegmentedRow {
    var cellTag: TokenCellTag? {
        return TokenCellTag(rawValue: self.tag ?? "")
    }
    convenience init(_ tag: CellTagType) {
        self.init(tag: tag.rawValue)
        self.title = tag.title
    }
    convenience init(_ tag: CellTagType, initializer: (SegmentedRow<T>) -> Void) {
        self.init(tag.rawValue, initializer)
        self.title = tag.title
    }
}

extension ActionSheetRow: ReactiveCompatible {}
extension Reactive where Base: ActionSheetRow<TokenAlgorithm> {
    var setValue: Binder<TokenAlgorithm?> {
        return Binder<TokenAlgorithm?>(base) { t, v in
            t.value = v
            t.updateCell()
        }
    }
    var getValue: Driver<TokenAlgorithm?> {
        return Observable<TokenAlgorithm?>.create { [base] observer -> Disposable in
            base.onChange { observer.onNext($0.value) }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: nil)
    }
}
extension Reactive where Base: ActionSheetRow<TokenCellStyle> {
    var setValue: Binder<TokenCellStyle?> {
        return Binder<TokenCellStyle?>(base) { t, v in
            t.value = v
            t.updateCell()
        }
    }
    var getValue: Driver<TokenCellStyle?> {
        return Observable<TokenCellStyle?>.create { [base] observer -> Disposable in
            base.onChange { observer.onNext($0.value) }
            return Disposables.create()
        }.asDriver(onErrorJustReturn: nil)
    }
}

extension ActionSheetRow {
    var cellTag: TokenCellTag? {
        return TokenCellTag(rawValue: self.tag ?? "")
    }
    convenience init(_ tag: CellTagType) {
        self.init(tag: tag.rawValue)
        self.title = tag.title
    }
    convenience init(_ tag: CellTagType, initializer: (ActionSheetRow<T>) -> Void) {
        self.init(tag.rawValue, initializer)
        self.title = tag.title
    }
}
