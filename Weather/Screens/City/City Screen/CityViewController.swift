//
//  CityViewController.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import UIKit

class CityViewController: BaseController {
    
    //MARK: - UI Elements
    let containerView    = WContainerView()
    let iconImageView    = UIImageView()
    let descriptionLabel = WMainTitleLabel(textAlignment: .center, fontSize: 18)
    let windSpeedLabel   = WMainTitleLabel(textAlignment: .center, fontSize: 16)
    let humidityLabel    = WMainTitleLabel(textAlignment: .center, fontSize: 16)
    let sunriseLabel     = WMainTitleLabel(textAlignment: .center, fontSize: 16)
    let sunsetLabel      = WMainTitleLabel(textAlignment: .center, fontSize: 16)
    
    //MARK: - Variables
    var padding       : CGFloat = 12
    var city          : String = ""
    
    var viewModel: CityViewModel? {
        didSet {
            configureUIElements()
        }
    }
    
    //MARK: - Init
    init(city: String) {
        super.init(nibName: nil, bundle: nil)
        self.city   = city
        title       = city
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
    }
    
}

//MARK: - Methods
extension CityViewController {

    private func getWeatherData(){
        
        if city == ""{
            configureEmptyState()
            self.presentAlert(title: "label_information".localized(), message: "label_empty_city".localized(), buttonTitle: "button_ok".localized())
            return
        }
        
        showLoadingView()
        NetworkManager.shared.fetchWeatherData(city: city) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.viewModel = CityViewModel(weatherData: weatherData)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.configureEmptyState()
                    self.presentAlert(title: "label_error".localized(), message: error.rawValue.localized(), buttonTitle: "button_ok".localized())
                }
            }
        }
    }
    
    private func configureUIElements(){
        
        if let viewModel = viewModel {
            iconImageView.image       = viewModel.image
            descriptionLabel.text     = viewModel.description
            windSpeedLabel.text       = viewModel.windSpeed
            humidityLabel.text        = viewModel.humidity
            sunriseLabel.text         = viewModel.sunrise
            sunsetLabel.text          = viewModel.sunset
        } else {
            configureEmptyState()
        }
        
    }
    
    private func configureEmptyState(){
        iconImageView.image       = UIImage(systemName: "photo.artframe")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        descriptionLabel.text     = "label_empty".localized()
        windSpeedLabel.text       = "label_empty".localized()
        humidityLabel.text        = "label_empty".localized()
        sunriseLabel.text         = "label_empty".localized()
        sunsetLabel.text          = "label_empty".localized()
    }
    
}

//MARK: - Anchor methods
extension CityViewController {
    
    private func configureView(){
        view.backgroundColor = .systemBackground
    }
    
    private func setupView(){
        configureView()
        addUIElements()
        configureContainerView()
        configureIconImageView()
        configureDescriptionLabel()
        configureWindSpeedLabel()
        configureHumidityLabel()
        configureSunRiseLabel()
        configureSunSetLabel()
    }
    
    private func addUIElements() {
        view.addSubViews(containerView)
        containerView.addSubViews(iconImageView, descriptionLabel, windSpeedLabel, humidityLabel, sunriseLabel, sunsetLabel)
    }
    
    func configureContainerView() {
        containerView.centerInSuperview()
        containerView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        containerView.withHeight(230)
        containerView.backgroundColor = .secondarySystemBackground
    }
    
    private func configureIconImageView(){
        iconImageView.centerInSuperview()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.withHeight(75)
        iconImageView.withWidth(75)
    }
    
    private func configureDescriptionLabel(){
        descriptionLabel.centerXInSuperview()
        descriptionLabel.numberOfLines = 2
        descriptionLabel.anchor(top: iconImageView.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: 0, right: padding))
    }
    
    private func configureWindSpeedLabel(){
        windSpeedLabel.centerYInSuperview()
        windSpeedLabel.numberOfLines = 2
        windSpeedLabel.anchor(top: nil, leading: containerView.leadingAnchor, bottom: nil, trailing: iconImageView.leadingAnchor, padding: .init(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    private func configureHumidityLabel(){
        humidityLabel.centerYInSuperview()
        humidityLabel.numberOfLines = 2
        humidityLabel.anchor(top: nil, leading: iconImageView.trailingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    private func configureSunRiseLabel(){
        sunriseLabel.centerXInSuperview()
        sunriseLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: padding, left: 0, bottom: 0, right: 0))
    }
    
    private func configureSunSetLabel(){
        sunsetLabel.centerXInSuperview()
        sunsetLabel.anchor(top: sunriseLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: padding, left: 0, bottom: 0, right: 0))
    }
    
}
