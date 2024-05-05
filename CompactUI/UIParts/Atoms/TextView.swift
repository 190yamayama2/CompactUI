//
//  InputTextField.swift
//  CompactUI
//
//  Created by 190yamayama on 2024/02/01.
//

import SwiftUI
import Combine

struct TextView: View {

    // MARK: - State

    @State var text: String

    // MARK: - Layout Property

    let layout: Layout

    // MARK: - Initializer

    init(
        text: String,
        layout: Layout = Layout()
    ) {
        self.text = text
        self.layout = layout
    }

    // MARK: - View

    var body: some View {
        if layout.hasBorder {
            textField.padding()
            .overlay(
                RoundedRectangle(cornerRadius: layout.cornerRadius)
                    .stroke(layout.borderColor, lineWidth: layout.borderWidth)
            )
        } else {
            textField.padding()
        }
    }

    private var textField: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(layout.placeholder)
                .font(layout.placeholderFont)
                .foregroundColor(layout.placeholderForegroundColor)
        )
        .onReceive(Just(text), perform: { newValue in
            let formatText = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
            if !formatText.isEmpty, formatText.count > layout.maxLength {
                text = String(formatText.prefix(layout.maxLength))
            } else {
                text = formatText
            }
        })
        .clearButton(text: $text)
        .font(layout.textFont)
        .foregroundColor(layout.textForegroundColor)
        .keyboardType(layout.keyboardType)
    }

}

// MARK: - Layout
extension TextView {

    /// InputTextField Layout
    final class Layout: BaseTextLayout {

        // MARK: - Property

        let maxLength: Int

        // MARK: - Initializer

        init(
            placeholder: String = "",
            placeholderFont: Font = LayoutDefault.secondaryFont,
            placeholderForegroundColor: Color = LayoutDefault.secondaryFontColor,
            textFont: Font = LayoutDefault.primaryFont,
            textForegroundColor: Color = LayoutDefault.primaryFontColor,
            keyboardType: UIKeyboardType = .default,
            maxLength: Int = -1,
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

private extension View {
    func clearButton(text: Binding<String>) -> some View {
        modifier(ClearButton(text: text))
    }
}

private struct ClearButton: ViewModifier {
    @Binding var text: String
    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 5)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    VStack {
        TextView(
            text: "",
            layout: TextView.Layout(
                placeholder: "Please enter your name.",
                maxLength: 16,
                hasBorder: true
            )
        )
        TextView(
            text: "",
            layout: TextView.Layout(
                placeholder: "Please enter your name.",
                maxLength: 16,
                hasBorder: false
            )
        )
    }
}
