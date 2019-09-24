//
//  CompactTokenView.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import RxSwift

class CompactTokenView: UIView, TokenViewType {
    static var style: TokenCellStyle = .compact
    
    static var requiredHeight: CGFloat = 50
    
    let model: TokenCellModel
    
    let label : UILabel = UILabel()
    let issuer: UILabel = UILabel()
    let time  : UILabel = UILabel()
    let code  : UILabel = UILabel()

    let bag = DisposeBag()
    
    required init(model: TokenCellModel) {
        self.model = model
        
        super.init(frame: .zero)
        
        addSubview(label)
        addSubview(issuer)
        addSubview(time)
        addSubview(code)
        
        bind()
    }
    
    func bind() {
        model.tokenLabel.drive(label.rx.text).disposed(by: bag)
        model.tokenIssuer.drive(issuer.rx.text).disposed(by: bag)
        model.tokenPassword.drive(code.rx.text).disposed(by: bag)
        model.tokenTimeRemaining.drive(time.rx.text).disposed(by: bag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
