//
//  Transform.swift
//  LZSwiftColorKit
//
//  Created by Sun Moon on 2020/2/24.
//

import UIKit

open class ColorTransForm {
    
    var prefix: Bool = false
    var alpha: Bool = false
    
    init(prefixToJSON: Bool = false, alphaToJSON: Bool = false) {
        prefix = prefixToJSON
        alpha = alphaToJSON
    }
    
    open func color(_ value: String) -> UIColor? {
        if value.isEmpty {
            return nil
        }
        
        if value.hasPrefix("#") {
            let index = value.index(value.startIndex, offsetBy: 1)
            let hex = String(value[index...])
            return getColor(hex: hex)
        } else {
            return getColor(hex: value)
        }
    }
    
    open func hex(_ value: UIColor) -> String? {
        if value.isKind(of: UIColor.self) {
            return hexString(color: value)
        }
        
        return nil
    }
    
    fileprivate func hexString(color: UIColor) -> String {
        let comps = color.cgColor.components!
        let compsCount = color.cgColor.numberOfComponents
        let r: Int
        let g: Int
        var b: Int
        let a = Int(comps[compsCount - 1] * 255)
        if compsCount == 4 { // RGBA
            r = Int(comps[0] * 255)
            g = Int(comps[1] * 255)
            b = Int(comps[2] * 255)
        } else { // Grayscale
            r = Int(comps[0] * 255)
            g = Int(comps[0] * 255)
            b = Int(comps[0] * 255)
        }
        var hexString: String = ""
        if prefix {
            hexString = "#"
        }
        hexString += String(format: "%02X%02X%02X", r, g, b)
        
        if alpha {
            hexString += String(format: "%02X", a)
        }
        return hexString
    }
    
    fileprivate func getColor(hex: String) -> UIColor? {
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                // Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8
                return nil
            }
        } else {
            // "Scan hex error
            return nil
        }
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
