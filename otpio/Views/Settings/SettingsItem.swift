//
//  SettingsItem.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import FontAwesome_swift
import RxDataSources

enum SettingsItem: Int, CaseIterable {
    case theme, cellStyle
    
    case about, support, credits
    
    var title: String {
        switch self {
        case .theme    : return "App Theme"
        case .cellStyle: return "Cell Style"
        case .about    : return "About OTP.io"
        case .support  : return "Get Support"
        case .credits  : return "Thanks To"
        }
    }
    var icon: FontAwesome {
        switch self {
        case .theme    : return .adjust
        case .cellStyle: return .pager
        case .about    : return .infoCircle
        case .support  : return .questionCircle
        case .credits  : return .handHoldingHeart
        }
    }
    var showDetail: Bool {
        switch self {
        case .theme, .cellStyle: return true
        default: return false
        }
    }
    var controller: UIViewController {
        switch self {
        default: return UIViewController()
        }
    }

    static let dataModel: [SectionModel<Void, SettingsItem>] = [
            SectionModel<Void, SettingsItem>.init(model: (), items: [.theme, .cellStyle]),
            SectionModel<Void, SettingsItem>.init(model: (), items: [.about, .support, .credits])
        ]
}
