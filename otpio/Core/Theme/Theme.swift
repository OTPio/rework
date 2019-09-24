//
//  Theme.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

extension DefaultsKeys {
    static let theme = DefaultsKey<Theme>("currentTheme", defaultValue: .nightLightDark)
}

protocol ThemeType {
    var primaryLabel        : UIColor { get } // Primary label color
    var secondaryLabel      : UIColor { get } // Secondary label color
    var iconColor           : UIColor { get } // The color of icons
    
    var primaryBackground   : UIColor { get } // The color of the main token display
    var secondaryBackground : UIColor { get } // The color of the view controller background
    var tertiaryBackground  : UIColor { get } // The color of the token footer view
    var iconBackground      : UIColor { get } // The color of the background for icons
    
    var navbarBackground    : UIColor { get } // The color of the navbar
    var navbarTitleColor    : UIColor { get } // The color of the navbar title
    var navbarBarButtonColor: UIColor { get } // The color of the navbar buttons
    
//    static var progressTrack      : UIColor { get }
}

enum Theme: Int, CustomStringConvertible, DefaultsSerializable, CaseIterable {
    static var `default`: Theme {
        get { return Defaults[.theme] }
        set { Defaults[.theme] = newValue }
    }
    case nightLightBright, nightLightDark
    case solarizedLight, solarizedDark
    case inTheWindLight, inTheWindDark
    
    var description: String {
        switch self {
        case .nightLightDark  : return "Night/Light Dark"
        case .nightLightBright: return "Night/Light Bright"
        case .solarizedDark   : return "Solarized Dark"
        case .solarizedLight  : return "Solarized Light"
        case .inTheWindDark   : return "In The Wind Dark"
        case .inTheWindLight  : return "In The Wind Light"
        }
    }
    
    var theme: ThemeType {
        switch self {
        case .nightLightDark  : return NightLightDark()
        case .nightLightBright: return NightLightBright()
        case .solarizedDark   : return SolarizedDark()
        case .solarizedLight  : return SolarizedLight()
        case .inTheWindDark   : return InTheWindDark()
        case .inTheWindLight  : return InTheWindLight()
        }
    }
}

internal extension UIColor {
  convenience init(_ rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
