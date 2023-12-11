//
//  LogInView.swift
//  Bankey
//
//  Created by kevin alexander on 8/12/23.
//

import Foundation
import UIKit

class LogInView: UIView{
    
    override init (frame: CGRect){
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension LogInView {
    
    func style(){
        backgroundColor = .orange
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    func layout( ){
        
    }
}