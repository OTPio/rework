//
//  Router.swift
//  otpio
//
//  Created by Mason Phillips on 10/15/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import UIKit.UIViewController
import MMDrawerController

class Router {
    static let shared: Router = Router()
    
    let currentOption    : Option = .default
    let currentController: UIViewController
    
    let controllers: Dictionary<Option, UIViewController>
    
    let menuController: MenuController
    let mainController: MMDrawerController
    
    init() {
        currentController = currentOption.controller
        controllers = [currentOption: currentController]
        
        menuController = MenuController()
        let nav = UINavigationController(rootViewController: currentController)
        
        #if DEBUG
            let tmenu = ThemeMenuController()
            mainController = MMDrawerController(center: nav, leftDrawerViewController: menuController, rightDrawerViewController: tmenu)
        #else
            mainController = MMDrawerController(center: nav, leftDrawerViewController: menuController)
        #endif
        
        mainController.openDrawerGestureModeMask = .all
        mainController.closeDrawerGestureModeMask = .all
    }
    
    func `switch`(to option: Option) {
        
    }
}
