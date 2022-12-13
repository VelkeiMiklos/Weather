//
//  UIImage+Ext.swift
//  Weather
//
//  Created by MV on 2022. 12. 13..
//

import UIKit

extension UIImage {

    class func iconCodeForImage(name: String) -> UIImage? {
        switch name {
        case "01d.png", "01n.png":
            return UIImage(systemName: "sun.max")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "02d.png", "02n.png":
            return UIImage(systemName: "cloud.sun")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "03d.png", "03n.png":
            return UIImage(systemName: "cloud")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "04d.png", "04n.png":
            return UIImage(systemName: "smoke")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "09d.png", "09n.png":
            return UIImage(systemName: "cloud.bolt.rain")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "10d.png", "10n.png":
            return UIImage(systemName: "cloud.sun.rain")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "11d.png", "11n.png":
            return UIImage(systemName: "cloud.bolt")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "13d.png", "13n.png":
            return UIImage(systemName: "snowflake.circle")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        case "50.png", "50n.png":
            return UIImage(systemName: "cloud.fog")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        default:
            return UIImage(systemName: "sun.min")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        }
    }

}
