//
//  SettingsViewController.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import Neon
import Eureka

class SettingsViewController: BaseFormController<SettingsModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        form
            +++ Section(SettingsSectionTag.settings)
                <<< TextRow(SettingsCellTag.cellStyle)
                <<< TextRow(SettingsCellTag.theme)
        
            +++ Section(SettingsSectionTag.available)
                <<< TextRow(SettingsCellTag.cloud)
        
            +++ Section(SettingsSectionTag.connect)
                <<< TextRow(SettingsCellTag.about)
                <<< TextRow(SettingsCellTag.reddit)
                <<< TextRow(SettingsCellTag.email)
                <<< TextRow(SettingsCellTag.support)
    }
}
