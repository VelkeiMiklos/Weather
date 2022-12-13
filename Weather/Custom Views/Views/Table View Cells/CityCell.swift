//
//  CityCell.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import UIKit

class CityCell: UITableViewCell {
    
    //MARK: - Variables
    static let reuseId           = "CityCell"
    private let cityNameLabel    = WMainTitleLabel(textAlignment: .left, fontSize: 26)
    private let countyNameLabel  = WSecondaryTitleLabel(fontSize: 16)
    private let padding          : CGFloat = 12
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Methods
extension CityCell{
    
    func set(city: City) {
        cityNameLabel.text      = city.city
        countyNameLabel.text    = city.county
    }
    
    private func configure() {
        
        addSubViews(cityNameLabel, countyNameLabel)
        accessoryType           = .disclosureIndicator
        
        cityNameLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: padding, left: padding, bottom: 0, right: (3 * padding)))
        countyNameLabel.anchor(top: cityNameLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 4, left: padding, bottom: 0, right: (3 * padding)))
        
    }
    
}
