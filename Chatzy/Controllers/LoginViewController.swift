//
//  LoginViewController.swift
//  Chatzy
//
//  Created by Mohamed Hany on 27/06/2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        emailTextfield.text = "1@2.com"
        passwordTextfield.text = "123456"
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text , let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let e = error{
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)

                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    strongSelf.present(alert, animated: true, completion: nil)
                }else{
                    strongSelf.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
