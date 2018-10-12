//
//  HomePresenter.swift
//  Contapp
//
//  Created GuimelGMC on 10/12/18.
//  Copyright © 2018 GuimelGMC. All rights reserved.
//
//

import UIKit
import Contacts

class HomePresenter {

    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    private let router: HomeWireframeProtocol
    let cStore = CNContactStore()

    init(interface: HomeViewProtocol, interactor: HomeInteractorProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    private func getContactsAuthorized() {
        do {
            var contacts = [CNContact]()
            
            let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactEmailAddressesKey, CNContactPhoneNumbersKey, CNContactSocialProfilesKey, CNContactImageDataAvailableKey, CNContactThumbnailImageDataKey] as [Any]
            let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
            try cStore.enumerateContacts(with: request) { (contact, stop) in
                contacts.append(contact)
            }
            view?.returnContacts(contacts)
        } catch {
            
        }
        
    }

}

extension HomePresenter: HomePresenterProtocol {
    
    func getContacts() {
        
        func requestAccess() {
            cStore.requestAccess(for: .contacts) { (auth, error) in
                if auth {
                    self.getContactsAuthorized()
                }
            }
        }
        
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            self.getContactsAuthorized()
            break
        case .denied:
            
            break
        case .restricted:
            
            break
        case .notDetermined:
            requestAccess()
            break
        }
    }
    
}
