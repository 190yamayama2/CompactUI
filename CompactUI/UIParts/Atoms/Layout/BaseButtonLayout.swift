//
//  BaseButtonLayout.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/24
//  
//

import SwiftUI

class BaseButtonLayout: BaseLayout {

    let text: String
    let height: CGFloat
    let textFont: Font
    let textForegroundColor: Color
    let hasTextUnderLine: Bool

    // MARK: - Initializer

    init(
        text: String,
        height: CGFloat = 30,
        textFont: Font = LayoutDefault.primaryFont,
        textForegroundColor: Color = LayoutDefault.primaryFontColor,
        hasTextUnderLine: Bool = false,
        topMargin: CGFloat = LayoutDefault.topMargin,
        leftMargin: CGFloat = LayoutDefault.leftMargin,
        rightMargin: CGFloat = LayoutDefault.rightMargin,
        bottomMargin: CGFloat = LayoutDefault.bottomMargin,
        backgroundColor: Color = LayoutDefault.backgroundColor,
        hasBorder: Bool = false,
        borderColor: Color = LayoutDefault.borderColor,
        borderWidth: CGFloat = LayoutDefault.borderWidth,
        cornerRadius: CGFloat = LayoutDefault.cornerRadius
    ) {
        self.text = text
        self.height = height
        self.textFont = textFont
        self.textForegroundColor = textForegroundColor
        self.hasTextUnderLine = hasTextUnderLine
        super.init(
            topMargin: topMargin,
            leftMargin: leftMargin,
            rightMargin: rightMargin,
            bottomMargin: bottomMargin,
            backgroundColor: backgroundColor,
            hasBorder: hasBorder,
            borderColor: borderColor,
            borderWidth: borderWidth,
            cornerRadius: cornerRadius
        )
    }

    init(
        layout: BaseButtonLayout
    ) {
        self.text = layout.text
        self.height = layout.height
        self.textFont = layout.textFont
        self.textForegroundColor = layout.textForegroundColor
        self.hasTextUnderLine = layout.hasTextUnderLine
        super.init(
            topMargin: layout.topMargin,
            leftMargin: layout.leftMargin,
            rightMargin: layout.rightMargin,
            bottomMargin: layout.bottomMargin,
            backgroundColor: layout.backgroundColor,
            hasBorder: layout.hasBorder,
            borderColor: layout.borderColor,
            borderWidth: layout.borderWidth,
            cornerRadius: layout.cornerRadius
        )
    }

}
