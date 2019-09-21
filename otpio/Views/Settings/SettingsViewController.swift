//
//  SettingsViewController.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import FontAwesome_swift
import Neon

class SettingsViewController: BaseFormController<SettingsModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
    }
}
