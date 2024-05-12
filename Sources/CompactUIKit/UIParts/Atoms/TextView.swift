//
//  InputTextField.swift
//  CompactUI
//
//  Created by 190yamayama on 2024/02/01.
//

import SwiftUI
import Combine

public struct TextView: View {

    // MARK: - State

    @State var text: String

    // MARK: - Layout Property

    let layout: Layout
    var onSubmitText: ((String) -> Void)

    // MARK: - Initializer

    init(
        text: String,
        layout: Layout = Layout(),
        onSubmitText: @escaping ((String) -> Void)
    ) {
        self.text = text
        self.layout = layout
        self.onSubmitText = onSubmitText
    }

    // MARK: - View

    public var body: some View {
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
            onSubmitText(text)
        })
        .clearButton(text: $text)
        .font(layout.textFont)
        .foregroundColor(layout.textForegroundColor)
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
            maxLength: Int = -1,
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
#if os(iOS)
    VStack {
        TextView(
            text: "",
            layout: TextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: true
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        TextView(
            text: "",
            layout: TextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#else
    VStack {
        TextView(
            text: "",
            layout: TextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: true
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        TextView(
            text: "",
            layout: TextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#endif
}
