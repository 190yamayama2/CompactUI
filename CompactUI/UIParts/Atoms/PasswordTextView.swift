//
//  PasswordTextView.swift
//  CompactUI
//
//  Created by 190yamayama on 2024/03/17.
//

import Combine
import SwiftUI

struct PasswordTextView: View {

    // MARK: - State

    @State var secureText: String
    @State private var displayText: String
    @State private var isShowSecure = false
    private var showSecureImage: Image
    private var hideSecureImage: Image

    // MARK: - Layout Property

    let layout: Layout

    // MARK: - Initializer

    init(
        secureText: String,
        layout: Layout = Layout(),
        showSecureImage: Image = Image(systemName: "eye"),
        hideSecureImage: Image = Image(systemName: "eye.slash")
    ) {
        self.secureText = secureText
        self.displayText = secureText
        self.layout = layout
        self.showSecureImage = showSecureImage
        self.hideSecureImage = hideSecureImage
    }

    // MARK: - View

    var body: some View {
        if layout.hasBorder {
            secureTextField
                .overlay(
                    RoundedRectangle(cornerRadius: layout.cornerRadius)
                        .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                )
        } else {
            secureTextField
        }
    }

    private var secureTextField: some View {
        HStack {
            VStack(alignment: .leading, content: {
                SecureField(
                    "",
                    text: $secureText,
                    prompt: Text(layout.placeholder)
                        .font(layout.placeholderFont)
                        .foregroundColor(layout.placeholderForegroundColor)
                )
                .foregroundColor(layout.textForegroundColor)
                .onReceive(Just(secureText), perform: { newValue in
                    let formatText = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !formatText.isEmpty
                        && layout.maxLength > 0
                        && formatText.count > layout.maxLength
                    {
                        secureText = String(formatText.prefix(layout.maxLength))
                    } else {
                        secureText = formatText
                    }
                })
                .onChange(of: secureText) { oldValue, newValue in
                    displayText = newValue
                }
                if isShowSecure {
                    Text(secureText)
                        .foregroundColor(layout.displayTextForegroundColor)
                }
            })
            if !secureText.isEmpty {
                Button {
                    secureText = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
            if layout.hasInputTextDisplayButton {
                Button {
                    isShowSecure.toggle()
                } label: {
                    isShowSecure ? showSecureImage : hideSecureImage
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

// MARK: - Layout
extension PasswordTextView {
    final class Layout: BaseTextLayout {

        // MARK: - Properties

        let maxLength: Int
        let hasInputTextDisplayButton: Bool
        let displayTextForegroundColor: Color

        // MARK: - Initializer

        init(
            placeholder: String = "",
            placeholderFont: Font = LayoutDefault.secondaryFont,
            placeholderForegroundColor: Color = LayoutDefault.secondaryFontColor,
            textFont: Font = LayoutDefault.primaryFont,
            textForegroundColor: Color = LayoutDefault.primaryFontColor,
            keyboardType: UIKeyboardType = .default,
            maxLength: Int = -1,
            hasInputTextDisplayButton: Bool = false,
            displayTextForegroundColor: Color = .gray,
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
            self.maxLength = maxLength
            self.hasInputTextDisplayButton = hasInputTextDisplayButton
            self.displayTextForegroundColor = displayTextForegroundColor
            super.init(
                textFont: textFont,
                textForegroundColor: textForegroundColor,
                placeholder: placeholder,
                placeholderFont: placeholderFont,
                placeholderForegroundColor: placeholderForegroundColor,
                keyboardType: keyboardType,
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
            layout: Layout
        ) {
            self.maxLength = layout.maxLength
            self.hasInputTextDisplayButton = layout.hasInputTextDisplayButton
            self.displayTextForegroundColor = layout.displayTextForegroundColor
            super.init(
                textFont: layout.textFont,
                textForegroundColor: layout.textForegroundColor,
                placeholder: layout.placeholder,
                placeholderFont: layout.placeholderFont,
                placeholderForegroundColor: layout.placeholderForegroundColor,
                keyboardType: layout.keyboardType,
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

}

// MARK: - Preview
#Preview {
    VStack {
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                placeholder: "8 to 16 half-width alphanumeric characters.",
                keyboardType: .asciiCapableNumberPad,
                hasInputTextDisplayButton: true
            )
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                placeholder: "8 to 16 half-width alphanumeric characters.",
                keyboardType: .asciiCapableNumberPad,
                hasInputTextDisplayButton: false
            )
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                placeholder: "8 to 16 half-width alphanumeric characters.",
                keyboardType: .asciiCapableNumberPad,
                hasInputTextDisplayButton: false, 
                backgroundColor: .gray,
                hasBorder: false
            )
        )
        .environment(\.colorScheme, .dark)
    }
}
