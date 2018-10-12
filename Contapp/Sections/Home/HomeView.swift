//
//  HomeViewController.swift
//  Contapp
//
//  Created GuimelGMC on 10/12/18.
//  Copyright © 2018 GuimelGMC. All rights reserved.
//
//

import UIKit
import Contacts

class HomeView: UIViewController {

	var presenter: HomePresenterProtocol?
    var contacts = [CNContact]()
    
    @IBOutlet weak var tableView: UITableView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getContacts()
        configureView()
    }
    
    func configureView() {
        
        let nibCell = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "ContactCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension HomeView: HomeViewProtocol {

    func returnContacts(_ contacts: [CNContact]) {
        self.contacts = contacts
        tableView.reloadData()
    }

}

extension HomeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactCell
        let contact = contacts[indexPath.row]
        
        cell.fillInfoInCell(contact: contact)
        
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
