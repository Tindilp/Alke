//
//  LoginViewController.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 13/09/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Atributes
    private let viewModel = MoviesViewModel()
    
    //MARK: - Ciclo de vida
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        if let mail = email.text,!mail.isEmpty{
            if validEmail(mail){
                startApp()}
            else{
                invalidEmail()}}
        else{
            campoUsuarioVacio()}
    }
 
    
    //MARK: - Buttom functions
    func validEmail(_ email: String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", viewModel.emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func startApp(){
        let vc = MenuViewController(nibName: "MenuViewController", bundle: nil)
        self.present(vc, animated: true,completion: nil)
        //let vc = ListViewController(nibName: "ListViewController", bundle: nil)
        //self.present(vc, animated: true,completion: nil)
    }
    
    private func invalidEmail(){
        let alert = UIAlertController(title: viewModel.alertName, message:viewModel.messageInvalidaEmail, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:viewModel.alertActionTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func campoUsuarioVacio(){
        let alert = UIAlertController(title:viewModel.alertName, message:viewModel.messageEmptyLabel, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:viewModel.alertActionTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
