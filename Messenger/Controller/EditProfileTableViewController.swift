//
//  EditProfileTableViewController.swift
//  Messenger
//
//  Created by pop on 5/6/21.
//

import UIKit
import Alamofire

class EditProfileTableViewController: UITableViewController {

    //Mark - IBOutlet
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var SurnameTextField: UITextField!
    @IBOutlet weak var BioTextField: UITextField!
    
    var status = ""
    var major = ""
    
    var image = UIImage()
    var name = ""
    var surname = ""
    var bio = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        setUp()
    }
    
    private func setUp() {
        NameTextField.text! = name
        SurnameTextField.text! = surname
        avatarImageView.image = image
        BioTextField.text! = bio
    }
    
    private func editProfile() {
        let parameter: [String: String] = [
            "name": NameTextField.text!,
            "surname": SurnameTextField.text!,
            "status": status,
            "major": "com",
            "bio": BioTextField.text!
        ]
        AF.request(Shared.url + "/user/profile", method: .put, parameters: parameter, encoder: JSONParameterEncoder.default)
            .responseJSON { (response) in
                if let code = response.response?.statusCode {
                    switch code {
                    case 200:
                        self.presentSuccessAlert()
                    default:
                        print("failed to reqeust")
                    }
                } else {
                    print("Failed to connect with server")
                }
                
                debugPrint(response)
            }

    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        editProfile()
    }
    
    private func presentSuccessAlert() {
        let alert = UIAlertController(title: "Success!!", message: "Edit profile successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
   
