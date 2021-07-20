//
//  ViewController.swift
//  AuthorizationApp
//
//  Created by Kristina Shlyapkina on 15.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!

    private let user = User.getUser()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabbar = segue.destination as? UITabBarController,
              let welcomeVC = tabbar.viewControllers?.first as? WelcomeViewController,
              let navavigationController = tabbar.viewControllers?.last as? UINavigationController,
              let moreInfo = navavigationController.viewControllers.last as? InfoMoreViewController
        else { return }
        welcomeVC.setUser(user: user)
        moreInfo.setUser(user: user)
    }

    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user.login || userPasswordTextField.text != user.password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password")
        }

        performSegue(withIdentifier: "Welcome View Controller", sender: nil)
    }

    @IBAction func forgotUserNameButtonPressed() {
        showAlert(title: "Oops!", message: "Your name is \(user.login)")
    }

    @IBAction func forgotUserPasswordButtonPressed() {
        showAlert(title: "Oops!", message: "Your password is \(user.password)")
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
    }

}

// MARK: - Private Methods

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userPasswordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userPasswordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }

}
