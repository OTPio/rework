//
//  Option.swift
//  otpio
//
//  Created by Mason Phillips on 10/15/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import FontAwesome_swift

enum Option: Int, CaseIterable {
    static let `default`: Option = .home
    case home, add, settings
    
    var title: String {
        switch self {
        case .home    : return "Home"
        case .add     : return "Add"
        case .settings: return "Settings"
        }
    }
    var icon: FontAwesome {
        switch self {
        case .home    : return .qrcode
        case .add     : return .plusSquare
        case .settings: return .userCog
        }
    }
    var controller: UIViewController {
        switch self {
            case .home    : return HomeViewController()
            case .add     : return AddViewController()
            case .settings: return SettingsViewController()
        }
    }
}
