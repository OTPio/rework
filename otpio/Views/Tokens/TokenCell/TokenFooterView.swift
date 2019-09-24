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
    
    let icon  : UILabel = UILabel()
    let detail: UILabel = UILabel()
    
    let bag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        
        icon.textColor = .white
        icon.font = .fontAwesome(ofSize: 20, style: .brands)
        addSubview(icon)
        
        detail.textColor = .white
        detail.textAlignment = .right
        detail.font = .fontAwesome(ofSize: 20, style: .light)
        detail.text = .fontAwesomeIcon(name: .chevronRight)
        addSubview(detail)
    }
    
    func bind(using model: TokenCellModel) {
        model.tokenIcon.map { $0?.unicode }.drive(icon.rx.text).disposed(by: bag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        icon.anchorToEdge(.left, padding: 10, width: 25, height: 20)
        detail.anchorToEdge(.right, padding: 10, width: 20, height: 20)
        
        self.layer.cornerRadius = 5
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
