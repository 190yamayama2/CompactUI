//
//  LayoutDefault.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/29
//  
//

import UIKit
import SwiftUI

/// LayoutDefault
/// This struct is a struct that collectively defines the standard layout.
/// Even if you define it here, you can override it individually in each component's initializer.
struct LayoutDefault {

    /// Default topMargin
    public static var topMargin: CGFloat = 16.0

    /// Default leftMargin
    public static var leftMargin: CGFloat = 16.0

    /// Default rightMargin
    public static var rightMargin: CGFloat = 16.0

    /// Default bottomMargin
    public static var bottomMargin: CGFloat = 16.0

    /// Default backgroundColor
    public static var backgroundColor: Color = .clear

    /// Default borderColor
    public static var borderColor: Color = Color.gray

    /// Default borderWidth
    public static var borderWidth: CGFloat = 1.0

    /// Default cornerRadius
    public static var cornerRadius: CGFloat = 16

    /// Default primaryFont
    public static var primaryFont: Font = .system(size: 12.0)

    /// Default primaryFontColor
    public static var primaryFontColor: Color = isDarkMode ? .white : .black

    /// Default fontSecondary
    public static var secondaryFont: Font = .system(size: 10.0)

    /// Default secondaryFontColor
    public static var secondaryFontColor: Color = .gray

    /// Default primaryUIFont
    public static var primaryUIFont: UIFont = .systemFont(ofSize: 12.0)

    /// Default primaryFontUIColor
    public static var primaryFontUIColor: UIColor = .black

    /// Default secondaryUIFont
    public static var secondaryUIFont: UIFont = .systemFont(ofSize: 10.0)

    /// Default secondaryFontUIColor
    public static var secondaryFontUIColor: UIColor = .gray

}

extension LayoutDefault {
    public static var isDarkMode: Bool {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return true
        } else {
            return false
        }
    }
}
