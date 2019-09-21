//
//  TokenCellStyle.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let cellStyle = DefaultsKey<TokenCellStyle>.init("cellStyle", defaultValue: .regular)
}

enum TokenCellStyle: String, CustomStringConvertible, CaseIterable, DefaultsSerializable {
    static var `default`: TokenCellStyle {
        get { return Defaults[.cellStyle] }
        set { Defaults[.cellStyle] = newValue }
    }
    case compact, regular, expanded
    
    var description: String {
        switch self {
        case .compact : return "Compact Style"
        case .regular : return "Regular Style"
        case .expanded: return "Expanded Style"
        }
    }
}
