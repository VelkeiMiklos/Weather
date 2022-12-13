//
//  WError.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import Foundation

enum WError: String, Error {
    
    case emptyCity          = "label_empty_city"
    case invalidData        = "label_invalid_data"
    case invalidResponse    = "label_invalid_response"
    case errorOccured       = "label_error_occured"
    
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
