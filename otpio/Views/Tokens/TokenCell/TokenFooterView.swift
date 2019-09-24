//
//  TokenFooterView.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import RxSwift

class TokenCellFooterView: UIView {
    
    let icon  : IconLabel = IconLabel(size: 18)
    let detail: BaseLabel = BaseLabel(align: .right, fontAwesomeStyle: .light)
    
    let bag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(icon)
        
        detail.text = .fontAwesomeIcon(name: .chevronRight)
        addSubview(detail)
        
        ThemeManager.shared.currentTheme.map { $0.theme.tertiaryBackground }
        .bind(to: rx.backgroundColor).disposed(by: bag)
    }
    
    func bind(using model: TokenCellModel) {
//        model.tokenIcon.map { $0?.unicode }.drive(icon.rx.text).disposed(by: bag)
        icon.text = .fontAwesomeIcon(name: .facebook)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        icon.anchorToEdge(.left, padding: 10, width: 25, height: 25)
        detail.anchorToEdge(.right, padding: 10, width: 20, height: 20)
        
        self.layer.cornerRadius = 5
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
