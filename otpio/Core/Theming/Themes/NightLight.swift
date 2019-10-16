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
    var primaryLabel        : UIColor = ColorName.NightLight.nldPrimaryLabel.color
    var secondaryLabel      : UIColor = ColorName.NightLight.nldSecondaryLabel.color
    var iconColor           : UIColor = ColorName.NightLight.nldIconColor.color
    
    var primaryBackground   : UIColor = ColorName.NightLight.nldPrimaryBackground.color
    var secondaryBackground : UIColor = ColorName.NightLight.nldSecondaryBackground.color
    var tertiaryBackground  : UIColor = ColorName.NightLight.nldTertiaryBackground.color
    var iconBackground      : UIColor = ColorName.NightLight.nldIconBackground.color
    
    var navbarBackground    : UIColor = ColorName.NightLight.nldNavbarBackground.color
    var navbarTitleColor    : UIColor = ColorName.NightLight.nldNavbarTitleColor.color
    var navbarBarButtonColor: UIColor = ColorName.NightLight.nldNavbarBarButtonColor.color
        
    var progressTrack       : UIColor = ColorName.NightLight.nldProgressTrack.color
}
struct NightLightBright: ThemeType {
    var primaryLabel        : UIColor = ColorName.NightLight.nlbPrimaryLabel.color
    var secondaryLabel      : UIColor = ColorName.NightLight.nlbSecondaryLabel.color
    var iconColor           : UIColor = ColorName.NightLight.nlbIconColor.color
    
    var primaryBackground   : UIColor = ColorName.NightLight.nlbPrimaryBackground.color
    var secondaryBackground : UIColor = ColorName.NightLight.nlbSecondaryBackground.color
    var tertiaryBackground  : UIColor = ColorName.NightLight.nlbTertiaryBackground.color
    var iconBackground      : UIColor = ColorName.NightLight.nlbIconBackground.color
    
    var navbarBackground    : UIColor = ColorName.NightLight.nlbNavbarBackground.color
    var navbarTitleColor    : UIColor = ColorName.NightLight.nlbNavbarTitleColor.color
    var navbarBarButtonColor: UIColor = ColorName.NightLight.nlbNavbarBarButtonColor.color
        
    var progressTrack       : UIColor = ColorName.NightLight.nlbProgressTrack.color
}
