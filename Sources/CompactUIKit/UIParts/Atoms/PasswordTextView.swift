//
//  PasswordTextView.swift
//  CompactUI
//
//  Created by 190yamayama on 2024/03/17.
//

import Combine
import SwiftUI

public struct PasswordTextView: View {

    // MARK: - State

    @State var secureText: String
    @State private var displayText: String
    @State private var isShowSecure = false
    private var showSecureImage: Image
    private var hideSecureImage: Image
    var onSubmitText: ((String) -> Void)

    // MARK: - Layout Property

    let layout: Layout

    // MARK: - Initializer

    public init(
        secureText: String,
        layout: Layout = Layout(),
        showSecureImage: Image = Image(systemName: "eye"),
        hideSecureImage: Image = Image(systemName: "eye.slash"),
        onSubmitText: @escaping ((String) -> Void)
    ) {
        self.secureText = secureText
        self.displayText = secureText
        self.layout = layout
        self.showSecureImage = showSecureImage
        self.hideSecureImage = hideSecureImage
        self.onSubmitText = onSubmitText
    }

    // MARK: - View

    public var body: some View {
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
                        let newText = String(formatText.prefix(layout.maxLength))
                        secureText = newText
                        displayText = newText
                    } else {
                        secureText = formatText
                        displayText = newValue
                    }
                    onSubmitText(secureText)
                })
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
                        .foregroundColor(layout.displayTextForegroundColor)
                }
                .buttonStyle(.plain)
            }
            if layout.hasInputTextDisplayButton {
                Button {
                    isShowSecure.toggle()
                } label: {
                    if isShowSecure {
                        hideSecureImage
                            .foregroundColor(layout.displayTextForegroundColor)
                    } else {
                        showSecureImage
                            .foregroundColor(layout.displayTextForegroundColor)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

// MARK: - Layout
extension PasswordTextView {
    final public class Layout: BaseTextLayout {

        // MARK: - Properties

        let maxLength: Int
        let hasInputTextDisplayButton: Bool
        let displayTextForegroundColor: Color

        // MARK: - Initializer

        public init(
            maxLength: Int = -1,
            hasInputTextDisplayButton: Bool = false,
            displayTextForegroundColor: Color = .gray,
            placeholder: String = "",
            placeholderFont: Font = LayoutDefault.secondaryFont,
            placeholderForegroundColor: Color = LayoutDefault.secondaryFontColor,
            textFont: Font = LayoutDefault.primaryFont,
            textForegroundColor: Color = LayoutDefault.primaryFontColor,
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

        public init(
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
#if os(iOS)
    VStack {
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: true,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters.",
                backgroundColor: .gray,
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters.",
                backgroundColor: .gray,
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
    }
#else
    VStack {
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: true,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters.",
                backgroundColor: .gray,
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        PasswordTextView(
            secureText: "",
            layout: PasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters.",
                backgroundColor: .gray,
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
    }
#endif
}
