//
//  LabeledSegmentPickerView.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/22
//  
//

import SwiftUI

struct LabeledSegmentPickerView: View {

    // MARK: - Enum

    enum PickerViewStyle {
        case segmented
        case palette
    }

    // MARK: - Properties

    @State var selectedKey: String
    let labelText: String
    let items: [(key: String, value: String)]
    let pickerViewStyle: PickerViewStyle
    let layout: Layout

    // MARK: - Initializer

    init(
        selectedKey: String,
        labelText: String,
        items: [(key: String, value: String)],
        pickerViewStyle: PickerViewStyle = .segmented,
        layout: Layout = Layout()
    ) {
        self.selectedKey = selectedKey
        self.labelText = labelText
        self.items = items
        self.pickerViewStyle = pickerViewStyle
        self.layout = layout
        /** 
         TODO:
         At the moment, Apple does not have a feature that allows you to change the style of SwiftUI Picker, so I will change it when Apple releases a property that allows you to change the style of SwiftUI Picker.
         **/
        UISegmentedControl.appearance().backgroundColor = UIColor(layout.backgroundColor)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(layout.segmentBackgroundColor)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: layout.segmentSelectedTextFont,
                .foregroundColor: layout.segmentSelectedTextColor
            ],
            for: .selected
        )
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: layout.segmentNormalTextFont,
                .foregroundColor: layout.segmentNormalTextColor
            ],
            for: .normal
        )
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: layout.titleAlignment, content: {
            Spacer().frame(height: layout.topMargin)
            HStack {
                Spacer().frame(width: layout.leftMargin)
                Text(verbatim: labelText)
                    .font(layout.titleTextFont)
                    .foregroundStyle(layout.titleTextColor)
                Spacer().frame(width: layout.rightMargin)
            }
            HStack {
                Spacer().frame(width: layout.leftMargin)
                switch pickerViewStyle {
                    case .segmented:
                        segmentedPicker
                    case .palette:
                        palettePicker
                }
                Spacer().frame(width: layout.rightMargin)
            }
            Spacer().frame(height: layout.bottomMargin)
        })
    }

    private var segmentedPicker: some View {
        picker.pickerStyle(.segmented)
    }

    private var palettePicker: some View {
        picker.pickerStyle(.palette)
    }

    private var picker: some View {
        Picker(
            selection: $selectedKey,
            label: Text(labelText),
            content: {
                ForEach(items, id: \.key) { key, value in
                    Text(value)
                        .tag(key)
                }
            }
        )
        .onChange(of: selectedKey) {
            print("selectedKey=\(selectedKey)")
        }
    }

}

// MARK: - Layout
extension LabeledSegmentPickerView {

    final class Layout: BaseLayout {

        // MARK: - Properties

        let titleTextFont: Font
        let titleTextColor: Color
        let titleAlignment: HorizontalAlignment
        let segmentSelectedTextColor: UIColor
        let segmentSelectedTextFont: UIFont
        let segmentNormalTextColor: UIColor
        let segmentNormalTextFont: UIFont
        let segmentBackgroundColor: Color

        // MARK: - Initializer

        init(
            textFont: Font = LayoutDefault.primaryFont,
            titleTextColor: Color = LayoutDefault.primaryFontColor,
            titleAlignment: HorizontalAlignment = .leading,
            segmentSelectedTextColor: UIColor = LayoutDefault.primaryFontUIColor,
            segmentSelectedTextFont: UIFont = LayoutDefault.primaryUIFont,
            segmentNormalTextColor: UIColor = LayoutDefault.primaryFontUIColor,
            segmentNormalTextFont: UIFont = LayoutDefault.primaryUIFont,
            segmentBackgroundColor: Color = LayoutDefault.backgroundColor,
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
            self.titleTextFont = textFont
            self.titleTextColor = titleTextColor
            self.titleAlignment = titleAlignment
            self.segmentSelectedTextColor = segmentSelectedTextColor
            self.segmentSelectedTextFont = segmentSelectedTextFont
            self.segmentNormalTextColor = segmentNormalTextColor
            self.segmentNormalTextFont = segmentNormalTextFont
            self.segmentBackgroundColor = segmentBackgroundColor
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
        LabeledSegmentPickerView(
            selectedKey: "",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .green,
                titleAlignment: .leading
            )
        )
        LabeledSegmentPickerView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .green,
                titleAlignment: .leading
            )
        )
        LabeledSegmentPickerView(
            selectedKey: "en",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .red,
                titleAlignment: .center,
                backgroundColor: .green
            )
        )
        LabeledSegmentPickerView(
            selectedKey: "jp",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .blue,
                titleAlignment: .trailing,
                backgroundColor: .green
            )
        )
        LabeledSegmentPickerView(
            selectedKey: "",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            pickerViewStyle: .palette,
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .green,
                titleAlignment: .leading
            )
        )
        LabeledSegmentPickerView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            pickerViewStyle: .palette,
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .green,
                titleAlignment: .leading
            )
        )
        LabeledSegmentPickerView(
            selectedKey: "en",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            pickerViewStyle: .palette,
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .red,
                titleAlignment: .center
            )
        )
        LabeledSegmentPickerView(
            selectedKey: "jp",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            pickerViewStyle: .palette,
            layout: LabeledSegmentPickerView.Layout(
                titleTextColor: .blue,
                titleAlignment: .trailing,
                segmentSelectedTextColor: .white,
                segmentBackgroundColor: .indigo,
                backgroundColor: .mint
            )
        )
    }
}
