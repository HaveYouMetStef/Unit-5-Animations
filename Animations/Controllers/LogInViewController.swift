//
//  LogInViewController.swift
//  Animations
//
//  Created by Stef Castillo on 2/8/23.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var faqButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    //MARK: Properties
    
    
//MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }
    
    //MARK: Actions
    @IBAction func logInButtonTaped(_ sender: Any) {
        toggleToLogIn()
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        toggleToSignUp()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        presentCardVC()
    }
    
    //MARK: Helper Methods
    func setupViews() {
        confirmButton.layer.cornerRadius = 8.0
        signUpButton.rotate()
        logInButton.rotate()
    }
    
    func toggleToLogIn() {
        UIView.animate(withDuration: 0.2) {
            self.confirmTextField.isHidden = true
            self.logInButton.alpha = 1.0
            self.signUpButton.alpha = 0.3
            self.confirmButton.setTitle("Log me in!", for: .normal)
            self.helpButton.setTitle("Forgot?", for: .normal)
            self.faqButton.setTitle("Hint", for: .normal)
        }
        
    }
    
    func toggleToSignUp() {
        UIView.animate(withDuration: 0.2) {
            self.confirmTextField.isHidden = false
            self.logInButton.alpha = 0.3
            self.signUpButton.alpha = 1.0
            self.confirmButton.setTitle("Sign me up!", for: .normal)
            self.helpButton.setTitle("Help", for: .normal)
            self.faqButton.setTitle("FAQ", for: .normal)
        }
    }
    
    func presentCardVC() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let cardVC = main.instantiateViewController(withIdentifier: "cardVC")
        cardVC.modalPresentationStyle = .fullScreen
        self.present(cardVC, animated: true)
    }
    

}//EOC

extension UIView {
    func rotate(by radians: CGFloat = (-CGFloat.pi/2)) {
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}//End of extenstion
