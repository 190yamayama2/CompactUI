//
//  BaseLayout.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/20
//  
//

import SwiftUI

public class BaseLayout{

    var topMargin: CGFloat
    var leftMargin: CGFloat
    var rightMargin: CGFloat
    var bottomMargin: CGFloat
    var backgroundColor: Color
    var backgroundUIColor: XColor? {
        guard let cgColor = backgroundColor.cgColor
        else { return nil }
        return XColor.init(cgColor: cgColor)
    }
    var hasBorder: Bool
    var borderColor: Color
    var borderWidth: CGFloat
    var cornerRadius: CGFloat

    // MARK: - Initializer

    public init(
        topMargin: CGFloat = LayoutDefault.topMargin,
        leftMargin: CGFloat = LayoutDefault.leftMargin,
        rightMargin: CGFloat = LayoutDefault.rightMargin,
        bottomMargin: CGFloat = LayoutDefault.bottomMargin,
        backgroundColor: Color = LayoutDefault.backgroundColor,
        hasBorder: Bool = true,
        borderColor: Color = LayoutDefault.borderColor,
        borderWidth: CGFloat = LayoutDefault.borderWidth,
        cornerRadius: CGFloat = LayoutDefault.cornerRadius
    ) {
        self.topMargin = leftMargin
        self.leftMargin = leftMargin
        self.rightMargin = rightMargin
        self.bottomMargin = bottomMargin
        self.backgroundColor = backgroundColor
        self.hasBorder = hasBorder
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
    }

    public init(
        layout: BaseLayout
    ) {
        self.topMargin = layout.topMargin
        self.leftMargin = layout.leftMargin
        self.rightMargin = layout.rightMargin
        self.rightMargin = layout.rightMargin
        self.bottomMargin = layout.bottomMargin
        self.backgroundColor = layout.backgroundColor
        self.hasBorder = layout.hasBorder
        self.borderColor = layout.borderColor
        self.borderWidth = layout.borderWidth
        self.cornerRadius = layout.cornerRadius
    }

}
