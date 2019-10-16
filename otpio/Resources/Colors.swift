// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  internal enum InTheWind {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eee8d5"></span>
    /// Alpha: 68% <br/> (0xeee8d5af)
    internal static let iwdIconBackground = ColorName(rgbaValue: 0xeee8d5af)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#6b7fd7"></span>
    /// Alpha: 100% <br/> (0x6b7fd7ff)
    internal static let iwdIconColor = ColorName(rgbaValue: 0x6b7fd7ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#153b50"></span>
    /// Alpha: 5% <br/> (0x153b500f)
    internal static let iwdNavbarBackground = ColorName(rgbaValue: 0x153b500f)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3599db"></span>
    /// Alpha: 100% <br/> (0x3599dbff)
    internal static let iwdNavbarBarButtonColor = ColorName(rgbaValue: 0x3599dbff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bdc3c7"></span>
    /// Alpha: 100% <br/> (0xbdc3c7ff)
    internal static let iwdNavbarTitleColor = ColorName(rgbaValue: 0xbdc3c7ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#153b50"></span>
    /// Alpha: 100% <br/> (0x153b50ff)
    internal static let iwdPrimaryBackground = ColorName(rgbaValue: 0x153b50ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b9cdda"></span>
    /// Alpha: 100% <br/> (0xb9cddaff)
    internal static let iwdPrimaryLabel = ColorName(rgbaValue: 0xb9cddaff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let iwdProgressTrack = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1b4f6b"></span>
    /// Alpha: 100% <br/> (0x1b4f6bff)
    internal static let iwdSecondaryBackground = ColorName(rgbaValue: 0x1b4f6bff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#9da2ab"></span>
    /// Alpha: 100% <br/> (0x9da2abff)
    internal static let iwdSecondaryLabel = ColorName(rgbaValue: 0x9da2abff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#123142"></span>
    /// Alpha: 100% <br/> (0x123142ff)
    internal static let iwdTertiaryBackground = ColorName(rgbaValue: 0x123142ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eee8d5"></span>
    /// Alpha: 68% <br/> (0xeee8d5af)
    internal static let iwlIconBackground = ColorName(rgbaValue: 0xeee8d5af)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3599db"></span>
    /// Alpha: 100% <br/> (0x3599dbff)
    internal static let iwlIconColor = ColorName(rgbaValue: 0x3599dbff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1768ac"></span>
    /// Alpha: 5% <br/> (0x1768ac0f)
    internal static let iwlNavbarBackground = ColorName(rgbaValue: 0x1768ac0f)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cfe2df"></span>
    /// Alpha: 100% <br/> (0xcfe2dfff)
    internal static let iwlNavbarBarButtonColor = ColorName(rgbaValue: 0xcfe2dfff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bdc3c7"></span>
    /// Alpha: 100% <br/> (0xbdc3c7ff)
    internal static let iwlNavbarTitleColor = ColorName(rgbaValue: 0xbdc3c7ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1768ac"></span>
    /// Alpha: 100% <br/> (0x1768acff)
    internal static let iwlPrimaryBackground = ColorName(rgbaValue: 0x1768acff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f7f9f9"></span>
    /// Alpha: 100% <br/> (0xf7f9f9ff)
    internal static let iwlPrimaryLabel = ColorName(rgbaValue: 0xf7f9f9ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let iwlProgressTrack = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1768ac"></span>
    /// Alpha: 100% <br/> (0x1768acff)
    internal static let iwlSecondaryBackground = ColorName(rgbaValue: 0x1768acff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b4b6b6"></span>
    /// Alpha: 100% <br/> (0xb4b6b6ff)
    internal static let iwlSecondaryLabel = ColorName(rgbaValue: 0xb4b6b6ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2c75b3"></span>
    /// Alpha: 100% <br/> (0x2c75b3ff)
    internal static let iwlTertiaryBackground = ColorName(rgbaValue: 0x2c75b3ff)
  }
  internal enum NightLight {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eee8d5"></span>
    /// Alpha: 68% <br/> (0xeee8d5af)
    internal static let nlbIconBackground = ColorName(rgbaValue: 0xeee8d5af)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2b2b2b"></span>
    /// Alpha: 100% <br/> (0x2b2b2bff)
    internal static let nlbIconColor = ColorName(rgbaValue: 0x2b2b2bff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bdc3c7"></span>
    /// Alpha: 5% <br/> (0xbdc3c70f)
    internal static let nlbNavbarBackground = ColorName(rgbaValue: 0xbdc3c70f)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3599db"></span>
    /// Alpha: 100% <br/> (0x3599dbff)
    internal static let nlbNavbarBarButtonColor = ColorName(rgbaValue: 0x3599dbff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2b2b2b"></span>
    /// Alpha: 100% <br/> (0x2b2b2bff)
    internal static let nlbNavbarTitleColor = ColorName(rgbaValue: 0x2b2b2bff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bdc3c7"></span>
    /// Alpha: 100% <br/> (0xbdc3c7ff)
    internal static let nlbPrimaryBackground = ColorName(rgbaValue: 0xbdc3c7ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2b2b2b"></span>
    /// Alpha: 100% <br/> (0x2b2b2bff)
    internal static let nlbPrimaryLabel = ColorName(rgbaValue: 0x2b2b2bff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let nlbProgressTrack = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#edf1f2"></span>
    /// Alpha: 100% <br/> (0xedf1f2ff)
    internal static let nlbSecondaryBackground = ColorName(rgbaValue: 0xedf1f2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#7e8b8c"></span>
    /// Alpha: 100% <br/> (0x7e8b8cff)
    internal static let nlbSecondaryLabel = ColorName(rgbaValue: 0x7e8b8cff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#7e8b8c"></span>
    /// Alpha: 100% <br/> (0x7e8b8cff)
    internal static let nlbTertiaryBackground = ColorName(rgbaValue: 0x7e8b8cff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eee8d5"></span>
    /// Alpha: 68% <br/> (0xeee8d5af)
    internal static let nldIconBackground = ColorName(rgbaValue: 0xeee8d5af)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3599db"></span>
    /// Alpha: 100% <br/> (0x3599dbff)
    internal static let nldIconColor = ColorName(rgbaValue: 0x3599dbff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2b2b2b"></span>
    /// Alpha: 5% <br/> (0x2b2b2b0f)
    internal static let nldNavbarBackground = ColorName(rgbaValue: 0x2b2b2b0f)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3599db"></span>
    /// Alpha: 100% <br/> (0x3599dbff)
    internal static let nldNavbarBarButtonColor = ColorName(rgbaValue: 0x3599dbff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bdc3c7"></span>
    /// Alpha: 100% <br/> (0xbdc3c7ff)
    internal static let nldNavbarTitleColor = ColorName(rgbaValue: 0xbdc3c7ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2b2b2b"></span>
    /// Alpha: 100% <br/> (0x2b2b2bff)
    internal static let nldPrimaryBackground = ColorName(rgbaValue: 0x2b2b2bff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#edf1f2"></span>
    /// Alpha: 100% <br/> (0xedf1f2ff)
    internal static let nldPrimaryLabel = ColorName(rgbaValue: 0xedf1f2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let nldProgressTrack = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#262626"></span>
    /// Alpha: 100% <br/> (0x262626ff)
    internal static let nldSecondaryBackground = ColorName(rgbaValue: 0x262626ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#95a5a6"></span>
    /// Alpha: 100% <br/> (0x95a5a6ff)
    internal static let nldSecondaryLabel = ColorName(rgbaValue: 0x95a5a6ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#7e8b8c"></span>
    /// Alpha: 100% <br/> (0x7e8b8cff)
    internal static let nldTertiaryBackground = ColorName(rgbaValue: 0x7e8b8cff)
  }
  internal enum Solarized {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eee8d5"></span>
    /// Alpha: 68% <br/> (0xeee8d5af)
    internal static let sldIconBackground = ColorName(rgbaValue: 0xeee8d5af)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d33682"></span>
    /// Alpha: 100% <br/> (0xd33682ff)
    internal static let sldIconColor = ColorName(rgbaValue: 0xd33682ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#002b36"></span>
    /// Alpha: 5% <br/> (0x002b360f)
    internal static let sldNavbarBackground = ColorName(rgbaValue: 0x002b360f)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#6c71c4"></span>
    /// Alpha: 100% <br/> (0x6c71c4ff)
    internal static let sldNavbarBarButtonColor = ColorName(rgbaValue: 0x6c71c4ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let sldNavbarTitleColor = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#002b36"></span>
    /// Alpha: 100% <br/> (0x002b36ff)
    internal static let sldPrimaryBackground = ColorName(rgbaValue: 0x002b36ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#93a1a1"></span>
    /// Alpha: 100% <br/> (0x93a1a1ff)
    internal static let sldPrimaryLabel = ColorName(rgbaValue: 0x93a1a1ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let sldProgressTrack = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#073642"></span>
    /// Alpha: 100% <br/> (0x073642ff)
    internal static let sldSecondaryBackground = ColorName(rgbaValue: 0x073642ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#657b83"></span>
    /// Alpha: 74% <br/> (0x657b83bf)
    internal static let sldSecondaryLabel = ColorName(rgbaValue: 0x657b83bf)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#586e75"></span>
    /// Alpha: 100% <br/> (0x586e75ff)
    internal static let sldTertiaryBackground = ColorName(rgbaValue: 0x586e75ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eee8d5"></span>
    /// Alpha: 68% <br/> (0xeee8d5af)
    internal static let sllIconBackground = ColorName(rgbaValue: 0xeee8d5af)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d33682"></span>
    /// Alpha: 100% <br/> (0xd33682ff)
    internal static let sllIconColor = ColorName(rgbaValue: 0xd33682ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fdf6e3"></span>
    /// Alpha: 5% <br/> (0xfdf6e30f)
    internal static let sllNavbarBackground = ColorName(rgbaValue: 0xfdf6e30f)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#6c71c4"></span>
    /// Alpha: 100% <br/> (0x6c71c4ff)
    internal static let sllNavbarBarButtonColor = ColorName(rgbaValue: 0x6c71c4ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let sllNavbarTitleColor = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fdf6e3"></span>
    /// Alpha: 100% <br/> (0xfdf6e3ff)
    internal static let sllPrimaryBackground = ColorName(rgbaValue: 0xfdf6e3ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#586e75"></span>
    /// Alpha: 100% <br/> (0x586e75ff)
    internal static let sllPrimaryLabel = ColorName(rgbaValue: 0x586e75ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#268bd2"></span>
    /// Alpha: 100% <br/> (0x268bd2ff)
    internal static let sllProgressTrack = ColorName(rgbaValue: 0x268bd2ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eee8d5"></span>
    /// Alpha: 100% <br/> (0xeee8d5ff)
    internal static let sllSecondaryBackground = ColorName(rgbaValue: 0xeee8d5ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#657b83"></span>
    /// Alpha: 74% <br/> (0x657b83bf)
    internal static let sllSecondaryLabel = ColorName(rgbaValue: 0x657b83bf)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#93a1a1"></span>
    /// Alpha: 100% <br/> (0x93a1a1ff)
    internal static let sllTertiaryBackground = ColorName(rgbaValue: 0x93a1a1ff)
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

// swiftlint:disable operator_usage_whitespace
internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
