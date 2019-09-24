//
//  CellStylePushRow.swift
//  otpio
//
//  Created by Mason Phillips on 9/24/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import Eureka

class CellStylePushRow: SelectorRow<CellStylePushCell> {
    
    let settingsTag: SettingsCellTag
    
    override var value: TokenCellStyle? {
        get { return .default }
        set { self.didChange(to: newValue) }
    }
    
    convenience init() {
        self.init(tag: "")
    }
    
    required init(tag: String?) {
        settingsTag = .cellStyle
        super.init(tag: settingsTag.rawValue)
        
        cell.detailLabel.text = value?.description
    }
    
    func didChange(to value: TokenCellStyle? ) {
        TokenCellStyle.default = value!
        cell.detailLabel.text = value?.description
    }
}

class CellStylePushCell: PushSelectorCell<TokenCellStyle> {
    let iconLabel  : BaseLabel = BaseLabel()
    
    let titleLabel : BaseLabel = BaseLabel()
    let detailLabel: BaseLabel = BaseLabel()
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconLabel.font = .fontAwesome(ofSize: 20, style: .regular)
        iconLabel.text = .fontAwesomeIcon(name: .listAlt)
        contentView.addSubview(iconLabel)
        
        titleLabel.text = "Cell Style"
        contentView.addSubview(titleLabel)
        
        detailLabel.textAlignment = .right
        contentView.addSubview(detailLabel)
    }
    
    override func layoutSubviews() {
        iconLabel.anchorAndFillEdge(.left, xPad: 15, yPad: 0, otherSize: 20)
        
        titleLabel.alignAndFillWidth(align: .toTheRightCentered, relativeTo: iconLabel, padding: 10, height: contentView.height * 0.9)
        detailLabel.anchorAndFillEdge(.right, xPad: 15, yPad: 0, otherSize: contentView.width * 0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
