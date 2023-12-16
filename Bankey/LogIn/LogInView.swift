//
//  LogInView.swift
//  Bankey
//
//  Created by kevin alexander on 8/12/23.
//

import Foundation
import UIKit

class LogInView: UIView {
    
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let stackView = UIStackView()
    let dividerView = UIView()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //This intrinsicContentSize tells the view how big it gonna be
    //override var intrinsicContentSize: CGSize {
    //    return CGSize(width: 100, height: 100)
    //}
}

extension LogInView {
    
    func style(){
        backgroundColor = .orange
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
        userNameTextField.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .lightGray
    }
    func layout( ){
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LogInView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    private func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
        return textField.text != "" ? true : false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
