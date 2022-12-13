//
//  WAlertContainerView.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import UIKit

class WContainerView: UIView {

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Methods
extension WContainerView {
    
    private func configure() {
        backgroundColor       = .systemBackground
        layer.cornerRadius    = 15
        layer.borderWidth     = 2
        layer.borderColor     = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
