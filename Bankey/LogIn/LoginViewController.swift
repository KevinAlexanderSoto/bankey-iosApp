//
//  ViewController.swift
//  Bankey
//
//  Created by kevin alexander on 7/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let LoginView = LogInView()

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
        LoginView.backgroundColor = .orange
    }
    
    
    private func layout( ){
        view.addSubview(LoginView)
        
        NSLayoutConstraint.activate([
            LoginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            LoginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: LoginView.trailingAnchor, multiplier: 1),
            
        ])
    }
}

