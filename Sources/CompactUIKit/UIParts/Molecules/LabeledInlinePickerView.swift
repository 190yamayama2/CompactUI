//
//  LabeledInlinePickerView.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/22
//  
//

import SwiftUI

public struct LabeledInlinePickerView: View {

    // MARK: - Enum

    public enum LabeleAlignment {
        case horizontal
        case vertical
    }

    // MARK: - Properties

    @State var selectedKey: String
    let items: [(key: String, value: String)]
    let layout: Layout
    let onSelected: ((String) -> Void)

    // MARK: - Initializer

    public init(
        selectedKey: String,
        items: [(key: String, value: String)],
        layout: Layout = Layout(),
        onSelected: @escaping ((String) -> Void)
    ) {
        self.selectedKey = selectedKey
        self.items = items
        self.layout = layout
        self.onSelected = onSelected
    }

    // MARK: - View

    public var body: some View {
        VStack {
            Spacer().frame(height: layout.topMargin)
            switch layout.alignment {
                case .horizontal:
#if os(iOS)
                    HStack {
                        Spacer().frame(width: layout.leftMargin)
                            if #available(iOS 15.0, *) {
                                Text(verbatim: layout.titleText)
                                    .font(layout.titleTextFont)
                                    .foregroundStyle(layout.titleTextColor)
                            } else {
                                Text(verbatim: layout.titleText)
                                    .font(layout.titleTextFont)
                                    .foregroundColor(layout.titleTextColor)
                            }
                        Spacer().frame(width: layout.leftMargin)
                        picker
                        Spacer()
                        Spacer().frame(width: layout.rightMargin)
                    }
#else
                    HStack {
                        Spacer().frame(width: layout.leftMargin)
                        picker
                        Spacer()
                        Spacer().frame(width: layout.rightMargin)
                    }
#endif
                case .vertical:
                    switch layout.titleAlignment {
                        case .leading:
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                if #available(iOS 15.0, *) {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
                                Spacer()
                                Spacer().frame(width: layout.rightMargin)
                            }
                        case .center:
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                Spacer()
                                if #available(iOS 15.0, *) {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
                                Spacer()
                                Spacer().frame(width: layout.rightMargin)
                            }
                        case .trailing:
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                Spacer()
                                if #available(iOS 15.0, *) {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
                                Spacer().frame(width: layout.rightMargin)
                            }
                        default:
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                Spacer()
                                if #available(iOS 15.0, *) {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: layout.titleText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
                                Spacer()
                                Spacer().frame(width: layout.rightMargin)
                            }
                    }
                    HStack {
                        Spacer().frame(width: layout.leftMargin)
                        picker
                        Spacer().frame(width: layout.rightMargin)
                    }
            }
            Spacer().frame(height: layout.bottomMargin)
        }
    }

    private var picker: some View {
#if os(iOS)
        Picker(
            selection: $selectedKey,
            label: Text(layout.titleText),
            content: {
                ForEach(items, id: \.key) { key, value in
                    if #available(iOS 15.0, *) {
                        Text(value)
                            .font(layout.selectionTextFont)
                            .foregroundStyle(layout.selectionTextColor)
                            .tag(key)
                    } else {
                        Text(value)
                            .font(layout.selectionTextFont)
                            .foregroundColor(layout.selectionTextColor)
                            .tag(key)
                    }
                }
            }
        )
        .pickerStyle(.inline)
        .onSubmit(of: .text) {
            onSelected(selectedKey)
        }
#else
        Picker(
            selection: $selectedKey,
            label: layout.alignment == .horizontal ? Text(labelText) : Text(""),
            content: {
                ForEach(items, id: \.key) { key, value in
                    if #available(iOS 15.0, *) {
                        Text(value)
                            .font(layout.selectionTextFont)
                            .foregroundStyle(layout.selectionTextColor)
                            .tag(key)
                    } else {
                        Text(value)
                            .font(layout.selectionTextFont)
                            .foregroundColor(layout.selectionTextColor)
                            .tag(key)
                    }
                }
            }
        )
        .pickerStyle(.inline)
        .onSubmit(of: .text) {
            onSelected(selectedKey)
        }
#endif
    }

}

// MARK: - Layout
extension LabeledInlinePickerView {
    final public class Layout: BaseLayout {

        // MARK: - Properties

        let alignment: LabeleAlignment
        let titleText: String
        let titleTextFont: Font
        let titleTextColor: Color
        let titleAlignment: HorizontalAlignment
        let selectionTextColor: Color
        let selectionTextFont: Font
        let selectionBackgroundColor: Color

        // MARK: - Initializer

        public init(
            alignment: LabeleAlignment = .horizontal,
            titleText: String = "",
            titleTextFont: Font = LayoutDefault.primaryFont,
            titleTextColor: Color = LayoutDefault.primaryFontColor,
            titleAlignment: HorizontalAlignment = .leading,
            selectionTextColor: Color = LayoutDefault.secondaryFontColor,
            selectionTextFont: Font = LayoutDefault.secondaryFont,
            selectionBackgroundColor: Color = LayoutDefault.backgroundColor,
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
            self.alignment = alignment
            self.titleText = titleText
            self.titleTextFont = titleTextFont
            self.titleTextColor = titleTextColor
            self.titleAlignment = titleAlignment
            self.selectionTextColor = selectionTextColor
            self.selectionTextFont = selectionTextFont
            self.selectionBackgroundColor = selectionBackgroundColor
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

        public init(
            layout: Layout
        ) {
            self.alignment = layout.alignment
            self.titleText = layout.titleText
            self.titleTextFont = layout.titleTextFont
            self.titleTextColor = layout.titleTextColor
            self.titleAlignment = layout.titleAlignment
            self.selectionTextColor = layout.selectionTextColor
            self.selectionTextFont = layout.selectionTextFont
            self.selectionBackgroundColor = layout.selectionBackgroundColor
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

}

// MARK: - Preview
#Preview {
#if os(iOS)
    VStack {
        LabeledInlinePickerView(
            selectedKey: "default",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledInlinePickerView.Layout(
                alignment: .horizontal,
                titleText: "Language"
            ),
            onSelected: { value in
                print(value)
            }
        )
        LabeledInlinePickerView(
            selectedKey: "default",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledInlinePickerView.Layout(
                alignment: .vertical,
                titleText: "Language"
            ),
            onSelected: { value in
                print(value)
            }
        )
    }
#else
    VStack {
        LabeledInlinePickerView(
            selectedKey: "default",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledInlinePickerView.Layout(
                alignment: .horizontal,
                titleText: "Language"
            ),
            onSelected: { value in
                print(value)
            }
        )
        LabeledInlinePickerView(
            selectedKey: "default",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledInlinePickerView.Layout(
                alignment: .vertical, 
                titleText: "Language",
                titleTextColor: .white,
                titleAlignment: .center
            ),
            onSelected: { value in
                print(value)
            }
        )
    }
#endif
}
