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
    
    private var imageName = ""
    private var titleText = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(imageName: String, titleText: String) {
        self.imageName = imageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingViewController {
    
    func style(){
        
        view.backgroundColor = .white
     
        setTranslatesAutoresizingMask(UIArray: [stackView, label, imageView])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage( named: imageName)
        
        label.text = titleText 
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
