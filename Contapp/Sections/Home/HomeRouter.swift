//
//  HomeRouter.swift
//  Contapp
//
//  Created GuimelGMC on 10/12/18.
//  Copyright © 2018 GuimelGMC. All rights reserved.
//
//

import UIKit

class HomeRouter: HomeWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createHomeModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = Utils.getViewControllerFrom(storyboard: "HomeView") as! HomeView
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
