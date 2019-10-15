//
//  NightLight.swift
//  otpio
//
//  Created by Mason Phillips on 9/24/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit

// A standard black/white theme

struct NightLightDark: ThemeType {
    var primaryLabel        : UIColor = UIColor(0xedf1f2ff)
    var secondaryLabel      : UIColor = UIColor(0x95a5a6ff)
    var iconColor           : UIColor = UIColor(0x3599dbff)
    
    var primaryBackground   : UIColor = UIColor(0x2b2b2bff)
    var secondaryBackground : UIColor = UIColor(0x262626ff)
    var tertiaryBackground  : UIColor = UIColor(0x7e8b8cff)
    var iconBackground      : UIColor = UIColor(0xeee8d5af)
    
    var navbarBackground    : UIColor = UIColor(0x2b2b2b0f)
    var navbarTitleColor    : UIColor = UIColor(0xbdc3c7ff)
    var navbarBarButtonColor: UIColor = UIColor(0x3599dbff)
        
    var progressTrack       : UIColor = UIColor(0x268bd2ff)
}
struct NightLightBright: ThemeType {
    var primaryLabel        : UIColor = UIColor(0x2b2b2bff)
    var secondaryLabel      : UIColor = UIColor(0x7e8b8cff)
    var iconColor           : UIColor = UIColor(0x2b2b2bff)
    
    var primaryBackground   : UIColor = UIColor(0xbdc3c7ff)
    var secondaryBackground : UIColor = UIColor(0xedf1f2ff)
    var tertiaryBackground  : UIColor = UIColor(0x7e8b8cff)
    var iconBackground      : UIColor = UIColor(0xeee8d5af)
    
    var navbarBackground    : UIColor = UIColor(0xbdc3c70f)
    var navbarTitleColor    : UIColor = UIColor(0x2b2b2bff)
    var navbarBarButtonColor: UIColor = UIColor(0x3599dbff)
        
    var progressTrack       : UIColor = UIColor(0x268bd2ff)
}
