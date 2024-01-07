//
//  AppDelegate.swift
//  Bankey
//
//  Created by kevin alexander on 7/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    
    private let loginViewController = LoginViewController() 
    private let onboardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        loginViewController.loginViewControllerDelegate = self
        onboardingContainerViewController.onboardingViewControllerDelegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogIn() {
        window?.rootViewController = onboardingContainerViewController
    }
    
    func didLogOut() {
    
    }
    
}

extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        
    }
    
    func didCloseOnboarding() {
        window?.rootViewController = loginViewController
    }
    
    
}

