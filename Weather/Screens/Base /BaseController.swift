//
//  BaseController.swift
//  Weather
//
//  Created by MV on 2022. 12. 13..
//

import UIKit

class BaseController: UIViewController {

    //MARK: - Variables
    var activityView: UIView!

    //MARK: - Methods
    func showLoadingView() {
        
        activityView = UIView(frame: view.bounds)
        view.addSubview(activityView)
        
        activityView.backgroundColor   = .primary
        activityView.alpha             = 0
        
        UIView.animate(withDuration: 0.25) {
            self.activityView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityView.addSubview(activityIndicator)

        activityIndicator.fillSuperview()

        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.activityView.removeFromSuperview()
            self.activityView = nil
        }
    }

}
