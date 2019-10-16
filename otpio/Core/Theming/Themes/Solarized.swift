//
//  Solarized.swift
//  otpio
//
//  Created by Mason Phillips on 9/24/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit

struct SolarizedDark: ThemeType {
    var primaryLabel        : UIColor = ColorName.Solarized.sldPrimaryLabel.color
    var secondaryLabel      : UIColor = ColorName.Solarized.sldSecondaryLabel.color
    var iconColor           : UIColor = ColorName.Solarized.sldIconColor.color
    
    var primaryBackground   : UIColor = ColorName.Solarized.sldPrimaryBackground.color
    var secondaryBackground : UIColor = ColorName.Solarized.sldSecondaryBackground.color
    var tertiaryBackground  : UIColor = ColorName.Solarized.sldTertiaryBackground.color
    var iconBackground      : UIColor = ColorName.Solarized.sldIconBackground.color
    
    var navbarBackground    : UIColor = ColorName.Solarized.sldNavbarBackground.color
    var navbarTitleColor    : UIColor = ColorName.Solarized.sldNavbarTitleColor.color
    var navbarBarButtonColor: UIColor = ColorName.Solarized.sldNavbarBarButtonColor.color
        
    var progressTrack       : UIColor = ColorName.Solarized.sldProgressTrack.color
}
struct SolarizedLight: ThemeType {
    var primaryLabel        : UIColor = ColorName.Solarized.sllPrimaryLabel.color
    var secondaryLabel      : UIColor = ColorName.Solarized.sllSecondaryLabel.color
    var iconColor           : UIColor = ColorName.Solarized.sllIconColor.color
    
    var primaryBackground   : UIColor = ColorName.Solarized.sllPrimaryBackground.color
    var secondaryBackground : UIColor = ColorName.Solarized.sllSecondaryBackground.color
    var tertiaryBackground  : UIColor = ColorName.Solarized.sllTertiaryBackground.color
    var iconBackground      : UIColor = ColorName.Solarized.sllIconBackground.color
    
    var navbarBackground    : UIColor = ColorName.Solarized.sllNavbarBackground.color
    var navbarTitleColor    : UIColor = ColorName.Solarized.sllNavbarTitleColor.color
    var navbarBarButtonColor: UIColor = ColorName.Solarized.sllNavbarBarButtonColor.color
        
    var progressTrack       : UIColor = ColorName.Solarized.sllProgressTrack.color
}
