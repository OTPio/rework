//
//  SettingsModel.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class SettingsModel: BaseModel {
    let settingsItems: BehaviorRelay<[SectionModel<Void, SettingsItem>]>
    
    required init() {
        settingsItems = BehaviorRelay(value: SettingsItem.dataModel)
        super.init()
    }
}
