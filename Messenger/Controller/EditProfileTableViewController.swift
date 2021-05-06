//
//  EditProfileTableViewController.swift
//  Messenger
//
//  Created by pop on 5/6/21.
//

import UIKit

class EditProfileTableViewController: UITableViewController {

    //Mark - IBOutlet
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var SurnameTextField: UITextField!
    @IBOutlet weak var BioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    
    }
}

extension EditProfileTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 1 {
            NameTextField.becomeFirstResponder()
        } else if indexPath.row == 2 {
            SurnameTextField.becomeFirstResponder()
        } else if indexPath.row == 3 {
            BioTextField.becomeFirstResponder()
        }
    }
}
   
