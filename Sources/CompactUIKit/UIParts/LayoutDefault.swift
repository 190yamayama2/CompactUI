//
//  LayoutDefault.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/29
//  
//

import SwiftUI
#if os (OSX)
public typealias XColor = NSColor
public typealias XImage = NSImage
public typealias XFont = NSFont
#elseif os(iOS)
public typealias XColor = UIColor
public typealias XImage = UIImage
public typealias XFont = UIFont
#endif

/// LayoutDefault
/// This struct is a struct that collectively defines the standard layout.
/// Even if you define it here, you can override it individually in each component's initializer.
public struct LayoutDefault {

    /// Default topMargin
    public static var topMargin: CGFloat = 16.0

    /// Default leftMargin
    public static var leftMargin: CGFloat = 16.0

    /// Default rightMargin
    public static var rightMargin: CGFloat = 16.0

    /// Default bottomMargin
    public static var bottomMargin: CGFloat = 16.0

    /// Default leadingPadding
    public static var leadingPadding: CGFloat = 4.0

    /// Default trailingPadding
    public static var trailingPadding: CGFloat = 4.0

    /// Default topPadding
    public static var topPadding: CGFloat = 4.0

    /// Default bottomPadding
    public static var bottomPadding: CGFloat = 4.0

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
    public static var primaryUIFont: XFont = .systemFont(ofSize: 12.0)

    /// Default primaryFontUIColor
    public static var primaryFontUIColor: XColor = .black

    /// Default secondaryUIFont
    public static var secondaryUIFont: XFont = .systemFont(ofSize: 10.0)

    /// Default secondaryFontUIColor
    public static var secondaryFontUIColor: XColor = .gray
    
    /// Default sliderColor
    public static var sliderColor: Color = .blue

    /// Default tabWidth
    public static var displayTabCount: DisplayTabCount = .four

    /// Default tabWidth
    public static var tabWidth: CGFloat = 80.0

    /// Default tabWidth
    public static var tabHeight: CGFloat = 40.0

    /// Default primaryFont
    public static var selectedTabFont: Font = .system(size: 14.0).bold()

    /// Default primaryFontColor
    public static var selectedTabFontColor: Color = isDarkMode ? .white : .gray

    /// Default primaryFont
    public static var tabFont: Font = .system(size: 12.0)

    /// Default primaryFontColor
    public static var tabFontColor: Color = isDarkMode ? .white : .gray

}

extension LayoutDefault {
    public static var isDarkMode: Bool {
#if canImport(UIKit)
        return UITraitCollection.current.userInterfaceStyle == .dark
#else
        return NSApplication.shared.effectiveAppearance.name == .darkAqua
#endif
    }
}
