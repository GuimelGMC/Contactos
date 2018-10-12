//
//  HomeProtocols.swift
//  Contapp
//
//  Created GuimelGMC on 10/12/18.
//  Copyright © 2018 GuimelGMC. All rights reserved.
//
//

import Foundation
import Contacts

//MARK: Wireframe -
protocol HomeWireframeProtocol: class {
    
}
//MARK: Presenter -
protocol HomePresenterProtocol: class {
    func getContacts()
}

//MARK: Interactor -
protocol HomeInteractorProtocol: class {
    
    var presenter: HomePresenterProtocol?  { get set }
}

//MARK: View -
protocol HomeViewProtocol: class {
    
    var presenter: HomePresenterProtocol?  { get set }
    func returnContacts(_ contacts: [CNContact])
    
}
