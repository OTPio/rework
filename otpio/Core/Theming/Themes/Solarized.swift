//
//  Solarized.swift
//  otpio
//
//  Created by Mason Phillips on 9/24/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit

struct SolarizedDark: ThemeType {
    var primaryLabel        : UIColor = UIColor(0x93a1a1ff)
    var secondaryLabel      : UIColor = UIColor(0x657b83bf)
    var iconColor           : UIColor = UIColor(0xd33682ff)
    
    var primaryBackground   : UIColor = UIColor(0x002b36ff)
    var secondaryBackground : UIColor = UIColor(0x073642ff)
    var tertiaryBackground  : UIColor = UIColor(0x586e75ff)
    var iconBackground      : UIColor = UIColor(0xeee8d5af)
    
    var navbarBackground    : UIColor = UIColor(0x002b360f)
    var navbarTitleColor    : UIColor = UIColor(0x268bd2ff)
    var navbarBarButtonColor: UIColor = UIColor(0x6c71c4ff)
        
    var progressTrack       : UIColor = UIColor(0x268bd2ff)
}
struct SolarizedLight: ThemeType {
    var primaryLabel        : UIColor = UIColor(0x586e75ff)
    var secondaryLabel      : UIColor = UIColor(0x657b83bf)
    var iconColor           : UIColor = UIColor(0xd33682ff)
    
    var primaryBackground   : UIColor = UIColor(0xfdf6e3ff)
    var secondaryBackground : UIColor = UIColor(0xeee8d5ff)
    var tertiaryBackground  : UIColor = UIColor(0x93a1a1ff)
    var iconBackground      : UIColor = UIColor(0xeee8d5af)
    
    var navbarBackground    : UIColor = UIColor(0xfdf6e30f)
    var navbarTitleColor    : UIColor = UIColor(0x268bd2ff)
    var navbarBarButtonColor: UIColor = UIColor(0x6c71c4ff)
        
    var progressTrack       : UIColor = UIColor(0x268bd2ff)
}
