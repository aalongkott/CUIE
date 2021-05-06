//
//  ProfileTableViewController.swift
//  Messenger
//
//  Created by pop on 4/27/21.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    //Mark - IBoutlet
    @IBOutlet weak var AvatarImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var SurnameLabel: UILabel!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var BioLabel: UILabel!
    
    //Mark - Vars
    var contact: ContactInfo?
    
    //Mark - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        tableView.tableFooterView = UIView()

        setupUI()
    }
    
    //Mark - Table View Delegates
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "tableviewBackgroundColor")
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            print("goto chat room")
        }
        
    }
    
    //Mark- set up UI
    private func setupUI() {
        if contact != nil {
            self.title = contact!.name
            NameLabel.text = contact!.name
            SurnameLabel.text = contact!.surname
            userIDLabel.text = contact!.userID
            StatusLabel.text = contact!.status
            //BioLabel.text = contact!.bio
            
        }
    }
    
    
}
