//
//  InfoMoreViewController.swift
//  AuthorizationApp
//
//  Created by Kristina Shlyapkina on 17.07.2021.
//

import UIKit

class InfoMoreViewController: UIViewController {

    private var user: User?

    func setUser(user: User?) {
        self.user = user
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfo = segue.destination as? InformationAboutUserViewController
        else { return }
        moreInfo.setUser(user: user)
    }

    @IBAction func moreInfoButtonPressed(_ sender: UIButton) {

//        performSegue(withIdentifier: "InformationAboutUserViewController", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = user else {
            dismiss(animated: true)
            return
        }

        navigationController?.navigationItem.title = user.person.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
