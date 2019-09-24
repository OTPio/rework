//
//  TokenViewType.swift
//  otpio
//
//  Created by Mason Phillips on 9/21/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit

protocol TokenViewType where Self: UIView {
    static var style: TokenCellStyle { get }
    static var requiredHeight: CGFloat { get }

    var model: TokenCellModel { get }
    
    init(model: TokenCellModel)
}
