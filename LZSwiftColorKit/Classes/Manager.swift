//
//  Manager.swift
//  LZSwiftColorKit
//
//  Created by Sun Moon on 2020/2/24.
//

open class ColorManager {
    
    public static let share = ColorManager()
    
    let transform = ColorTransForm()
    let cache = NSCache<AnyObject, AnyObject>()
    
    open func toColor(_ hex: String) -> UIColor {
        guard let color = cache.object(forKey: hex as AnyObject) as? UIColor else {
            if let c = transform.color(hex) {
                cache.setObject(c as AnyObject, forKey: hex as AnyObject)
                return c
            } else {
                return .black
            }
        }
        return color
    }
}
