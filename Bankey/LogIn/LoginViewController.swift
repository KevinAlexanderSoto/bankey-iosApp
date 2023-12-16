//
//  ViewController.swift
//  Bankey
//
//  Created by kevin alexander on 7/12/23.
//

import UIKit

// te view Controller handle events of our app
class LoginViewController: UIViewController {
    
    let LoginView = LogInView()
    let SignInButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        // Do any additional setup after loading the view.
    }


}

extension LoginViewController {
    private func style(){
        
        LoginView.translatesAutoresizingMaskIntoConstraints = false
        
        SignInButton.translatesAutoresizingMaskIntoConstraints = false
        SignInButton.configuration = .filled()
        SignInButton.configuration?.imagePadding = 8
        SignInButton.setTitle("Sign In", for: [])
        SignInButton.addTarget(self, action: #selector(onSignInClick), for: .primaryActionTriggered)
    }
    
    
    private func layout( ){
        view.addSubview(LoginView)
        view.addSubview(SignInButton)
        
        //LoginView
        NSLayoutConstraint.activate([
            LoginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            LoginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: LoginView.trailingAnchor, multiplier: 1),
            
            
        ])
        //signInButtonView
        NSLayoutConstraint.activate([
            SignInButton.topAnchor.constraint(equalToSystemSpacingBelow: LoginView.bottomAnchor, multiplier: 1),
            SignInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: SignInButton.trailingAnchor, multiplier: 2),
            
        ])
    }
}

extension LoginViewController {
    @objc func onSignInClick (sender : UIButton){
        
    }
}

