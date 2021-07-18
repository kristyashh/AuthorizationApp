//
//  FavoriteMoviesAndBooksViewController.swift
//  AuthorizationApp
//
//  Created by Kristina Shlyapkina on 17.07.2021.
//

import UIKit

class FavoriteMoviesAndBooksViewController: UIViewController {

    private var user: User?

    func setUser(user: User?) {
        self.user = user
    }

    @IBOutlet weak var filmsInfo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        filmsInfo.text = user?.person.films
        // Do any additional setup after loading the view.
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
