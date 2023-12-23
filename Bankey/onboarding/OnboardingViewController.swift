//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by kevin alexander on 23/12/23.
//

import Foundation
import UIKit

class OnboardingViewController : UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel( )
    let imageView = UIImageView( )
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
    
    func style(){
     
        setTranslatesAutoresizingMask(UIArray: [stackView, label, imageView])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage( named: "delorean")
        
        label.text = "Bankey is faster, earier to use, and has a brand new look and feel that will make you feel old."
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
    }
    
    func layout(){
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        addSubViews(UIArray: [stackView])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}

extension OnboardingViewController {
    
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
