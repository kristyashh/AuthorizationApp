//
//  WelcomeViewController.swift
//  AuthorizationApp
//
//  Created by Kristina Shlyapkina on 15.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeNameLabel: UILabel!
    private var user: User?

    func setUser(user: User?) {
        self.user = user
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else {
            dismiss(animated: true)
            return
        }
        welcomeNameLabel.text = "Welcome, \(user.person.name)"
    }


}
