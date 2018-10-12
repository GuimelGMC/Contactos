//
//  Utils.swift
//  Contapp
//
//  Created by GuimelGMC on 10/12/18.
//  Copyright © 2018 GuimelGMC. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static func getViewControllerFrom(storyboard: String, withVC identifier: String? = nil) -> UIViewController? {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        
        if let idvc = identifier {
            return sb.instantiateViewController(withIdentifier: idvc)
        } else {
            guard let vc = sb.instantiateInitialViewController() else { return nil }
            return vc
        }
    }
    
    
}
