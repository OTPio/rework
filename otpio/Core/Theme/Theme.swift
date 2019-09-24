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
    static var primaryLabel       : UIColor { get }
    static var secondaryLabel     : UIColor { get }
    
    static var primaryBackground  : UIColor { get }
    static var secondaryBackground: UIColor { get }
    static var navbarBackground   : UIColor { get }
    
    static var tableCellBackground: UIColor { get }
    static var progressTrack      : UIColor { get }
}

enum Theme: Int, CustomStringConvertible, DefaultsSerializable, CaseIterable {
    static var `default`: Theme {
        get { return Defaults[.theme] }
        set { Defaults[.theme] = newValue }
    }
    case nightLightBright, nightLightDark
    case solarizedLight, solarizedDark
    
    var description: String {
        switch self {
        case .nightLightDark  : return "Night/Light Dark"
        case .nightLightBright: return "Night/Light Bright"
        case .solarizedDark   : return "Solarized Dark"
        case .solarizedLight  : return "Solarized Light"
        }
    }
    
    var theme: ThemeType {
        switch self {
        case .nightLightDark  : return NightLightDark()
        case .nightLightBright: return NightLightBright()
        case .solarizedDark   : return SolarizedDark()
        case .solarizedLight  : return SolarizedLight()
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

struct NightLightDark: ThemeType {
    static var primaryLabel       : UIColor = UIColor(0x002b36ff)
    static var secondaryLabel     : UIColor = UIColor(0x002b36ff)
    static var primaryBackground  : UIColor = UIColor(0x002b36ff)
    static var secondaryBackground: UIColor = UIColor(0x002b36ff)
    static var navbarBackground   : UIColor = .yellow
    static var tableCellBackground: UIColor = .yellow
    static var progressTrack      : UIColor = UIColor(0x002b36ff)
}
struct NightLightBright: ThemeType {
    static var primaryLabel       : UIColor = UIColor(0x002b36ff)
    static var secondaryLabel     : UIColor = UIColor(0x002b36ff)
    static var primaryBackground  : UIColor = UIColor(0x002b36ff)
    static var secondaryBackground: UIColor = UIColor(0x002b36ff)
    static var navbarBackground   : UIColor = .yellow
    static var tableCellBackground: UIColor = .yellow
    static var progressTrack      : UIColor = UIColor(0x002b36ff)
}

struct SolarizedDark: ThemeType {
    static var primaryLabel       : UIColor = UIColor(0x839496ff)
    static var secondaryLabel     : UIColor = UIColor(0x586e75ff)
    static var primaryBackground  : UIColor = UIColor(0x002b36ff)
    static var secondaryBackground: UIColor = UIColor(0x073642ff)
    static var navbarBackground   : UIColor = .yellow
    static var tableCellBackground: UIColor = .yellow
    static var progressTrack      : UIColor = UIColor(0x268bd2ff)
}
struct SolarizedLight: ThemeType {
    static var primaryLabel       : UIColor = UIColor(0x657b83ff)
    static var secondaryLabel     : UIColor = UIColor(0x93a1a1ff)
    static var primaryBackground  : UIColor = UIColor(0xfdf6e3ff)
    static var secondaryBackground: UIColor = UIColor(0xeee8d5ff)
    static var navbarBackground   : UIColor = .yellow
    static var tableCellBackground: UIColor = .yellow
    static var progressTrack      : UIColor = UIColor(0xb58900ff)
}
