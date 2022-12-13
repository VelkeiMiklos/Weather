//
//  WEmptyView.swift
//  Weather
//
//  Created by MV on 2022. 12. 13..
//

import UIKit

class WEmptyView: UIView {
    
    //MARK: - UI Elements
    let messageLabel       = WMainTitleLabel(textAlignment: .center, fontSize: 28)
    let emptyImageView     = UIImageView()
    
    //MARK: - Variables
    private let padding    : CGFloat = 12
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
}

//MARK: - Methods
extension WEmptyView {

    private func configureView() {
        addSubViews(messageLabel, emptyImageView)
        configureMessageLabel()
        configureEmptyImageView()
    }
    
    private func configureMessageLabel(){
        messageLabel.numberOfLines = 3
        messageLabel.textColor     = .secondaryLabel
        messageLabel.centerInSuperview()
        messageLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    private func configureEmptyImageView(){
        emptyImageView.image = UIImage(systemName: "exclamationmark.octagon")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        emptyImageView.anchor(top: messageLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: padding, left: 0, bottom: 0, right: 0))
        emptyImageView.centerXInSuperview()
        emptyImageView.withHeight(200)
        emptyImageView.withWidth(200)
    }
    
}
