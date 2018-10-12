//
//  ContactCell.swift
//  Contapp
//
//  Created by GuimelGMC on 10/12/18.
//  Copyright © 2018 GuimelGMC. All rights reserved.
//

import UIKit
import Contacts

class ContactCell: UITableViewCell {

    @IBOutlet weak var contentPhoto: UIView!
    @IBOutlet weak var cPhoto: UIImageView!
    @IBOutlet weak var cSiglas: UILabel!
    @IBOutlet weak var cName: UILabel!
    @IBOutlet weak var cPhone: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentPhoto.layer.cornerRadius = contentPhoto.frame.height / 2
        contentPhoto.clipsToBounds = true
    }
    
    func fillInfoInCell(contact: CNContact) {
        cName.text = "\(contact.givenName) \(contact.familyName)"
        if let image = contact.thumbnailImageData {
            imageView?.image = UIImage(data: image)
            cSiglas.isHidden = true
        } else {
            imageView?.isHidden = true
            cSiglas.isHidden = false
            cSiglas.text = contact.namePrefix
        }
        
        if contact.phoneNumbers.count > 0 {
            self.cPhone.text = contact.phoneNumbers[0].value.stringValue
        }
    }
    
}
