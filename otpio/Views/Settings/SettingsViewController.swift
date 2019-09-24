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
                <<< CellStylePushRow()
                <<< ActionSheetRow<Theme>(SettingsCellTag.theme) { row in
                    row.value = .default
                    row.options = Theme.allCases
                }.onChange({ row in
                    ThemeManager.shared.currentTheme.accept(row.value!)
                })
        
            +++ Section(SettingsSectionTag.available)
                <<< SwitchRow(SettingsCellTag.cloud) { $0.value = true }
        
            +++ Section(SettingsSectionTag.connect)
                <<< TextRow(SettingsCellTag.about)
                <<< TextRow(SettingsCellTag.reddit)
                <<< TextRow(SettingsCellTag.email)
                <<< TextRow(SettingsCellTag.support)
    }
}
