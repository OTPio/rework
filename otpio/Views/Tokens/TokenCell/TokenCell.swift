//
//  TokenCell.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit

class TokenCell: BaseTableCell<ExtendedToken, TokenCellModel> {
    static let identifier: String = "tokenCell"
    
//    var tokenViews: [TokenCellStyle: TokenViewType] {
//        return [
//            .compact : CompactTokenView(model: model),
//            .regular : RegularTokenView(model: model),
//            .expanded: ExpandedTokenView(model: model)
//        ]
//    }
    
    var tokenDisplayView: RegularTokenView = RegularTokenView()
    let tokenFooterView : TokenCellFooterView = TokenCellFooterView()
    
    var currentStyle: TokenCellStyle = .default

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tokenDisplayView.model = self.model
        contentView.addSubview(tokenDisplayView)
        
        tokenFooterView.bind(using: model)
        contentView.addSubview(tokenFooterView)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
//        tokenDisplayView.addSubview(tokenViews[currentStyle]!)
        
        
//        ThemeManager.shared.currentCellStyle.subscribe(onNext: switchStyle).disposed(by: bag)
    }
    
    override func configure(with item: ExtendedToken) {
        model.token.accept(item)
    }
    
//    func switchStyle(to style: TokenCellStyle) {
//        if let old = tokenViews[currentStyle], let new = tokenViews[style] {
//            old.removeFromSuperview()
//            tokenDisplayView.addSubview(new)
//            currentStyle = style
//        }
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.fillSuperview(left: 15, right: 15, top: 10, bottom: 10)
        
        tokenFooterView.anchorAndFillEdge(.bottom, xPad: 0, yPad: 0, otherSize: 35)
        tokenDisplayView.alignAndFillHeight(align: .aboveCentered, relativeTo: tokenFooterView, padding: 5, width: contentView.width)
        
        tokenDisplayView.subviews.first?.fillSuperview()
    }
}
