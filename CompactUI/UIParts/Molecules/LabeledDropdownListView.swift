//
//  LabeledDropdownListView.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/22
//  
//

import SwiftUI

/// Currently it is not possible to change the font or color of the dropdown list.
struct LabeledDropdownListView: View {

    // MARK: - Enum

    enum LabeleAlignment {
        case horizontal
        case vertical
    }

    // MARK: - Properties

    @State var selectedKey: String
    let labelText: String
    let items: [(key: String, value: String)]
    let layout: Layout

    // MARK: - Initializer

    init(
        selectedKey: String,
        labelText: String,
        items: [(key: String, value: String)],
        layout: Layout = Layout()
    ) {
        self.selectedKey = selectedKey
        self.labelText = labelText
        self.items = items
        self.layout = layout
    }

    // MARK: - View

    var body: some View {
        VStack {
            Spacer().frame(height: layout.topMargin)
            switch layout.alignment {
                case .horizontal:
                    HStack {
                        Spacer().frame(width: layout.leftMargin)
                        Text(verbatim: labelText)
                            .font(layout.titleTextFont)
                            .foregroundStyle(layout.titleTextColor)
                        picker
                        Spacer()
                        Spacer().frame(width: layout.rightMargin)
                    }
                case .vertical:
                    HStack {
                        Spacer().frame(width: layout.leftMargin)
                        Text(verbatim: labelText)
                            .font(layout.titleTextFont)
                            .foregroundStyle(layout.titleTextColor)
                        Spacer()
                        Spacer().frame(width: layout.rightMargin)
                    }
                    HStack {
                        Spacer().frame(width: layout.leftMargin)
                        picker
                        Spacer()
                        Spacer().frame(width: layout.rightMargin)
                    }
            }
            Spacer().frame(height: layout.bottomMargin)
        }
    }

    private var picker: some View {
        Menu {
            Picker("", selection: $selectedKey, content: {
                ForEach(items, id: \.key) { key, value in
                    Text(value)
                        .font(layout.selectionTextFont)
                        .foregroundColor(layout.selectionTextColor)
                        .tag(key)
                }
            })
        } label: {
            Text(items.first(where: { $0.key == selectedKey})?.value ?? "")
                .font(layout.selectionTextFont)
                .foregroundColor(layout.selectionTextColor)
        }
        .onChange(of: selectedKey) {
            print("selectedKey=\(selectedKey)")
        }
    }

}

// MARK: - Layout
extension LabeledDropdownListView {
    final class Layout: BaseLayout {

        // MARK: - Properties

        let alignment: LabeleAlignment
        let titleTextFont: Font
        let titleTextColor: Color
        let titleAlignment: HorizontalAlignment
        let selectionTextColor: Color
        let selectionTextFont: Font
        let selectionBackgroundColor: Color

        // MARK: - Initializer

        init(
            alignment: LabeleAlignment = .horizontal,
            textFont: Font = LayoutDefault.primaryFont,
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
            self.titleTextFont = textFont
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

    }

}

#Preview {
    VStack {
        LabeledDropdownListView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledDropdownListView.Layout(
                alignment: .horizontal
            )
        )
        LabeledDropdownListView(
            selectedKey: "en",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledDropdownListView.Layout(
                alignment: .horizontal
            )
        )
        LabeledDropdownListView(
            selectedKey: "jp",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledDropdownListView.Layout(
                alignment: .horizontal
            )
        )
        LabeledDropdownListView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledDropdownListView.Layout(
                alignment: .vertical
            )
        )
        LabeledDropdownListView(
            selectedKey: "en",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledDropdownListView.Layout(
                alignment: .vertical
            )
        )
        LabeledDropdownListView(
            selectedKey: "jp",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledDropdownListView.Layout(
                alignment: .vertical
            )
        )
    }
}
