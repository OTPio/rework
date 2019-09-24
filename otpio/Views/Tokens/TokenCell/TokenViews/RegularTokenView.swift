//
//  RegularTokenView.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import RxSwift

class RegularTokenView: UIView {
    static var style: TokenCellStyle = .regular
    
    static var requiredHeight: CGFloat = 120
    
    var model: TokenCellModel? {
        didSet {
            bind(using: self.model!)
        }
    }
    
    let label : UILabel = UILabel()
    let issuer: UILabel = UILabel()
    let time  : UILabel = UILabel()
    let code  : UILabel = UILabel()

    let bag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemBlue
        
        label.textColor = .white
        addSubview(label)
        
        issuer.textColor = .white
        addSubview(issuer)
        
        time.textAlignment = .right
        time.textColor = .white
        addSubview(time)
        
        code.textAlignment = .right
        code.textColor = .white
        addSubview(code)
    }
    
    func bind(using model: TokenCellModel) {
        model.tokenLabel.drive(label.rx.text).disposed(by: bag)
        model.tokenIssuer.drive(issuer.rx.text).disposed(by: bag)
        model.tokenPassword.drive(code.rx.text).disposed(by: bag)
        model.tokenTimeRemaining.drive(time.rx.text).disposed(by: bag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.anchorInCorner(.topLeft, xPad: 15, yPad: 15, width: width * 0.7, height: 20)
        issuer.anchorInCorner(.bottomLeft, xPad: 15, yPad: 15, width: width * 0.7, height: 20)
        
        code.anchorInCorner(.topRight, xPad: 15, yPad: 15, width: width * 0.3, height: 20)
        time.anchorInCorner(.bottomRight, xPad: 15, yPad: 15, width: width * 0.2, height: 20)
        
        self.layer.cornerRadius = 7
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
