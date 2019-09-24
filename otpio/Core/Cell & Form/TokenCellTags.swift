//
//  TokenCellTags.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation

protocol SectionTagType {
    var rawValue: String { get }
    var title   : String { get }
    var footer  : String { get }
}
protocol CellTagType {
    var rawValue: String { get }
    var title   : String { get }
}

typealias TokenSectionTag = TokenTags.SectionTag
typealias TokenCellTag    = TokenTags.CellTag
struct TokenTags {
    enum SectionTag: String, CaseIterable, SectionTagType {
        case secret, details, advanced, storage
        
        var title: String {
            return NSLocalizedString("header_\(self.rawValue)", tableName: "FormStrings", bundle: .main, value: self.rawValue.uppercased(), comment: self.rawValue.uppercased())
        }
        var footer: String {
            return NSLocalizedString("footer_\(self.rawValue)", tableName: "FormStrings", bundle: .main, value: self.rawValue.uppercased(), comment: self.rawValue.uppercased())
        }
    }

    enum CellTag: String, CaseIterable, CellTagType {
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

typealias SettingsSectionTag = SettingsTags.SectionTag
typealias SettingsCellTag = SettingsTags.CellTag
struct SettingsTags {
    enum SectionTag: String, CaseIterable, SectionTagType {
        case settings, available, connect
        
        var title: String {
            return self.rawValue.capitalized
        }
        var footer: String {
            return self.rawValue.capitalized
        }
    }
    
    enum CellTag: String, CaseIterable, CellTagType {
        case theme, cellStyle
        case cloud
        case about, email, reddit, support
        
        var title: String {
            switch self {
            case .cellStyle: return "Cell Style"
            default: return self.rawValue.capitalized
            }
        }
    }
}
