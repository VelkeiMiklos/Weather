//
//  String+Ext.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import Foundation

extension String {
    
    func localized(withComment comment: String = "") -> String {
        return Bundle.localization.localizedString(forKey: self,
                                                            value: "**\(self)**",
                                                            table: nil)
    }
    
}
