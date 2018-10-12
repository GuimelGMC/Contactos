//
//  AppDependencies.swift
//  Contapp
//
//  Created by GuimelGMC on 10/12/18.
//  Copyright © 2018 GuimelGMC. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies: NSObject {
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    override init() {
        
    }
    
    func initWithWindow(_ window: UIWindow) {
        self.window = window
        self.configDependencies()
    }
    
    func installRootViewController() {
        let home = HomeRouter.createHomeModule()
        navigationController = UINavigationController(rootViewController: home)
        self.window?.rootViewController = navigationController
    }
    
    func configDependencies() {
        
    }
    
}
