//
//  Theme.swift
//  otpio
//
//  Created by Mason Phillips on 10/15/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation

enum Theme {
    static let `default`: Theme = .nightLight(type: .dark)
    case solarized(type: LightDark)
    case inTheWind(type: LightDark)
    case nightLight(type: LightDark)
    
    enum LightDark {
        case light, dark
    }
}
