//
//  ViewController.swift
//  Bankey
//
//  Created by kevin alexander on 7/12/23.
//

import UIKit


protocol LoginViewControllerDelegate: AnyObject {
    func didLogIn( )
    
    func didLogOut( )
}

// te view Controller handle events of our app
class LoginViewController: UIViewController {
    
    let LoginView = LogInView()
    let titleView = UILabel()
    let subTitleView = UILabel()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let msg = "Hello world"
    
    let toastController: UIAlertController =
            UIAlertController(
              title: "Login",
              message: "Hello world,you ahve been logged in",
              preferredStyle: .alert
            )
    
    weak var loginViewControllerDelegate: LoginViewControllerDelegate?
    
    //computed properties
    
    var useName : String? {
        return LoginView.userNameTextField.text
    }
    
    var passWord : String? {
        return LoginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        view.makeSecure()
        // Do any additional setup after loading the view.
    }


}

extension LoginViewController {
    private func style(){
        setTranslatesAutoresizingMask(UIArray: [LoginView, signInButton, errorMessageLabel, titleView, subTitleView])
        
        titleView.text = "Bankey"
        titleView.textAlignment = .center
        titleView.font = UIFont.systemFont(ofSize: 24)
        
        subTitleView.text = "Your personal and bauty bank"
        subTitleView.textAlignment = .center
        subTitleView.font = UIFont.systemFont(ofSize: 16)
        
        
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(onSignInClick), for: .primaryActionTriggered)
        
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    
    private func layout( ){
        addSubViews(UIArray: [LoginView, signInButton, errorMessageLabel, titleView, subTitleView])
        
        //title view
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 30),
            
            titleView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleView.trailingAnchor, multiplier: 1),
            
        ])
        
        //subtitle view
        NSLayoutConstraint.activate([
            subTitleView.topAnchor.constraint(equalToSystemSpacingBelow: titleView.bottomAnchor, multiplier: 8),
            
            subTitleView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subTitleView.trailingAnchor, multiplier: 1),
            
        ])
        
        //LoginView
        NSLayoutConstraint.activate([
            LoginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            LoginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: LoginView.trailingAnchor, multiplier: 1),
            
            
        ])
        //signInButtonView
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: LoginView.bottomAnchor, multiplier: 1),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 2),
            
        ])
        //error label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1),
            
        ])
    }
    
    private func setTranslatesAutoresizingMask( UIArray: [UIView] ){
        for UIview in UIArray {
            UIview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addSubViews( UIArray: [UIView] ){
        for UIview in UIArray {
            view.addSubview(UIview)
        }
    }
}

extension LoginViewController {
    @objc func onSignInClick (sender : UIButton){
        errorMessageLabel.isHidden = true
        //addSecureText("image")
        logIn( )
    }
    
    private func logIn( ){
        guard let userName = useName, let passWord = passWord else {
            assertionFailure("userName or Password should not be nil")
            return
        }
        
        if userName.isEmpty || passWord.isEmpty {
            setErrorMessag(withMessage : "user name or password can not be empty")
            return
        }
        signInButton.configuration?.showsActivityIndicator = true
        showAlert()
        loginViewControllerDelegate?.didLogIn()
    }
    
    private func setErrorMessag ( withMessage message : String){
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
   
}

extension LoginViewController  {
    
    func showAlert(){
        self.present(
                toastController,
                animated: true,
                completion: nil
              )

              DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                  self.toastController.dismiss(
                    animated: true,
                    completion: nil
                )
              }
    }
            
}

extension UIView {
    func makeSecure() {
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            field.isUserInteractionEnabled = false
            field.backgroundColor = .orange
            self.addSubview(field)
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
            
            field.layer.sublayers?.last?.addSublayer(self.layer)
        }
    }
}
