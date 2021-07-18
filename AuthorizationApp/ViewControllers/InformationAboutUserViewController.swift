//
//  InformationAboutUserViewController.swift
//  AuthorizationApp
//
//  Created by Kristina Shlyapkina on 17.07.2021.
//

import UIKit

class InformationAboutUserViewController: UIViewController {

    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var informationTextView: UITextView!

    private var user: User?

    func setUser(user: User?) {
        self.user = user
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameUserLabel.text = user?.person.name
        dateLabel.text = user?.person.date
        cityLabel.text = user?.person.city
        informationTextView.text = user?.person.info

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let factsInfo = segue.destination as? InterestingFactsViewController {
            factsInfo.setUser(user: user)
        }

        if let filmsInfo = segue.destination as? FavoriteMoviesAndBooksViewController {
            filmsInfo.setUser(user: user)
        }
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
