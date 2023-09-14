//
//  File.swift
//  
//
//  Created by Jevon Mao on 4/11/21.
//
#if canImport(UIKit)
import UIKit

extension UIColor{
    static var systemGray2: UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor(red: 0.68, green: 0.68, blue: 0.7, alpha: 1)
            }
            return UIColor.clear
        }
    }
    static var systemGray4: UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1)
            }
            return UIColor.clear
            
        }
    }
    static var systemGray5: UIColor {
        get {
        if #available(iOS 13.0, *) {
            return UIColor(red: 0.9, green: 0.9, blue: 0.92, alpha: 1)
        }
            return UIColor.clear
        }
    }
    static var secondarySystemBackground: UIColor {
        get {
            if #available(tvOS 13.0, iOS 13.0, *) {
                return UIColor { (traits) -> UIColor in
                    return traits.userInterfaceStyle == .dark ?
                        UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1) :
                        UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1)
                }
            } else {
                return UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1)
            }
        }
    }
    static var systemBackground: UIColor {
        get {
            if #available(tvOS 13.0, iOS 13.0, *) {
                return UIColor { (traits) -> UIColor in
                    return traits.userInterfaceStyle == .dark ?
                        UIColor(red: 0, green: 0, blue: 0, alpha: 1) :
                        UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                }
            } else {
                return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
}

#elseif canImport(AppKit)
import AppKit


extension NSColor {
    /// SwifterSwift: Create an NSColor with different colors for light and dark mode.
    ///
    /// - Parameters:
    ///     - light: Color to use in light/unspecified mode.
    ///     - dark: Color to use in dark mode.
    @available(OSX 10.15, *)
    convenience init(light: NSColor, dark: NSColor) {
        self.init(name: nil, dynamicProvider: { $0.name == .darkAqua ? dark : light })
    }
    
}

extension NSColor {
    static var systemGray2: NSColor {
        return NSColor(red: 0.68, green: 0.68, blue: 0.7, alpha: 1)
    }
    
    static var systemGray4: NSColor {
        return NSColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1)
    }
    
    static var systemGray5: NSColor {
        return NSColor(red: 0.9, green: 0.9, blue: 0.92, alpha: 1)
    }
    
    static var secondarySystemBackground: NSColor {
        if #available(OSX 10.15, *) {
            return NSColor(light: NSColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1),
                           dark: NSColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1))
        } else {
            return NSColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1)
        }
    }
    
    static var systemBackground: NSColor {
        if #available(OSX 10.15, *) {
            return NSColor(light: NSColor(red: 1, green: 1, blue: 1, alpha: 1),
                           dark: NSColor(red: 0, green: 0, blue: 0, alpha: 1))
        } else {
            return NSColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}


#endif
