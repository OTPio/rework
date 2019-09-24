//
//  BaseUIKit.swift
//  otpio
//
//  Created by Mason Phillips on 9/24/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import FontAwesome_swift
import RxSwift
import RxCocoa

class BaseLabel: UILabel {

    private let isPrimary: Bool
    
    let bag = DisposeBag()
    
    init(isPrimary: Bool = true, fontSize: CGFloat = UIFont.systemFontSize, align: NSTextAlignment = .left) {
        self.isPrimary = isPrimary
        super.init(frame: .zero)
        
        font = .systemFont(ofSize: fontSize)
        textAlignment = align
        
        ThemeManager.shared.currentTheme.map { $0.theme }
        .map { [isPrimary] t in isPrimary ? t.primaryLabel : t.secondaryLabel }
        .bind(to: rx.textColor).disposed(by: bag)
    }
    
    init(isPrimary: Bool = true, fontSize: CGFloat = UIFont.systemFontSize, align: NSTextAlignment = .left, fontAwesomeStyle: FontAwesomeStyle = .regular) {
        self.isPrimary = isPrimary
        super.init(frame: .zero)
        
        font = .fontAwesome(ofSize: fontSize, style: fontAwesomeStyle)
        textAlignment = align
        
        ThemeManager.shared.currentTheme.map { $0.theme }
        .map { [isPrimary] t in isPrimary ? t.primaryLabel : t.secondaryLabel }
        .bind(to: rx.textColor).disposed(by: bag)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class IconLabel: UILabel {
    let bag = DisposeBag()

    init(size: CGFloat = UIFont.systemFontSize) {
        super.init(frame: .zero)
        
        font = .fontAwesome(ofSize: size, style: .brands)
        textAlignment = .center
        
        ThemeManager.shared.currentTheme.map { $0.theme.iconBackground }
        .bind(to: rx.backgroundColor)
        .disposed(by: bag)
        
        ThemeManager.shared.currentTheme.map { $0.theme.iconColor }
        .bind(to: rx.textColor)
        .disposed(by: bag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension Reactive where Base: UILabel {
    var textColor: Binder<UIColor> {
        return Binder(base) { t, v in
            t.textColor = v
        }
    }
}
