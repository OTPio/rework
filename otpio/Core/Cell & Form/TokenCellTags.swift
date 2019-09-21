//
//  TokenCellTags.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation

typealias SectionTag = TokenTags.SectionTag
typealias CellTag    = TokenTags.CellTag
struct TokenTags {
    enum SectionTag: String, CaseIterable {
        case secret, details, advanced, storage
        
        var title: String {
            return NSLocalizedString("header_\(self.rawValue)", tableName: "FormStrings", bundle: .main, value: self.rawValue.uppercased(), comment: self.rawValue.uppercased())
        }
        var footer: String {
            return NSLocalizedString("footer_\(self.rawValue)", tableName: "FormStrings", bundle: .main, value: self.rawValue.uppercased(), comment: self.rawValue.uppercased())
        }
    }

    enum CellTag: String, CaseIterable {
        case secret, textType
        case issuer, name, icon
        case advanced, digits, period, algorithm, type
        case inCloud, inToday
        
        var title: String {
            switch self {
            case .inCloud : return "Save in iCloud"
            case .inToday : return "Show in Today"
            case .advanced: return "Show Advanced Details"
            case .textType, .type: return ""
            default: return self.rawValue.capitalized
            }
        }
    }
}
