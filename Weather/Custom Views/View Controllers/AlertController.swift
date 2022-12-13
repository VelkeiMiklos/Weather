//
//  AlertController.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import UIKit

class AlertController: UIViewController {
    
    //MARK: - UI Elements
    let containerView   = WContainerView()
    let titleLabel      = WMainTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel    = WSecondaryTitleLabel(fontSize: 16)
    let actionButton    = WMainButton(backgroundColor: .primary, title: "button_ok".localized())
    
    //MARK: - Variables
    var alertTitle  : String?
    var message     : String?
    var buttonTitle : String?
    let padding     : CGFloat = 20
    
    //MARK: - Init
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle     = title
        self.message        = message
        self.buttonTitle    = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Cycle
    override func loadView() {
        super.loadView()
        configureViewBackground()
        addViews()
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: - Configure Views
extension AlertController{
    
    private func addViews(){
        view.addSubViews(containerView, titleLabel, actionButton, messageLabel)
    }
    
    private func configureViewBackground(){
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
    func configureContainerView() {
        containerView.centerInSuperview()
        containerView.withWidth(290)
        containerView.withHeight(230)
    }
    
    func configureTitleLabel() {
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: 0, right: padding))
        titleLabel.text = alertTitle ?? "alert_title_default".localized()
    }
    
    func configureMessageLabel() {
        messageLabel.anchor(top: titleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 32, left: padding, bottom: 0, right: padding))
        messageLabel.text           = message ?? "alert_message_default".localized()
        messageLabel.numberOfLines  = 4
    }
    
    func configureActionButton() {
        actionButton.anchor(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: padding, bottom: 12, right: padding))
        actionButton.withHeight(44)
        actionButton.setTitle(buttonTitle ?? "button_ok".localized(), for: .normal)
        actionButton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    }

}

//MARK: - Selectors
extension AlertController {
    
    @objc func dismissController() {
        dismiss(animated: true)
    }
    
}
