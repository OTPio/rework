//
//  ThemeType.swift
//  otpio
//
//  Created by Mason Phillips on 10/15/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import UIKit.UIColor

protocol ThemeType {
    var primaryLabel        : UIColor { get }
    var secondaryLabel      : UIColor { get }
    var iconColor           : UIColor { get }
    
    var primaryBackground   : UIColor { get }
    var secondaryBackground : UIColor { get }
    var tertiaryBackground  : UIColor { get }
    var iconBackground      : UIColor { get }
    
    var navbarBackground    : UIColor { get }
    var navbarTitleColor    : UIColor { get }
    var navbarBarButtonColor: UIColor { get }
        
    var progressTrack       : UIColor { get }

}
