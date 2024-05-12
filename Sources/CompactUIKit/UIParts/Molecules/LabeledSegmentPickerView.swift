//
//  LabeledSegmentPickerView.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/22
//  
//

import SwiftUI
#if os(iOS)
import UIKit
#endif

public struct LabeledSegmentPickerView: View {

    // MARK: - Enum

    public enum PickerViewStyle {
        case segmented
        case palette
    }

    // MARK: - Properties

    @State var selectedKey: String
    let labelText: String
    let items: [(key: String, value: String)]
    let pickerViewStyle: PickerViewStyle
    let layout: Layout
    var onSelected: ((String) -> Void)

    // MARK: - Initializer

    public init(
        selectedKey: String,
        labelText: String,
        items: [(key: String, value: String)],
        pickerViewStyle: PickerViewStyle = .segmented,
        layout: Layout = Layout(),
        onSelected: @escaping ((String) -> Void)
    ) {
        self.selectedKey = selectedKey
        self.labelText = labelText
        self.items = items
        self.pickerViewStyle = pickerViewStyle
        self.layout = layout
        self.onSelected = onSelected
#if os(iOS)
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
#endif
    }

    // MARK: - View

    public var body: some View {
        VStack(alignment: layout.titleAlignment, content: {
            Spacer().frame(height: layout.topMargin)
            switch layout.alignment {
                case .horizontal:
#if os(iOS)
                    HStack {
                        Spacer().frame(width: layout.leftMargin)
                        if #available(iOS 15.0, *) {
                            Text(verbatim: labelText)
                                .font(layout.titleTextFont)
                                .foregroundStyle(layout.titleTextColor)
                        } else {
                            Text(verbatim: labelText)
                                .font(layout.titleTextFont)
                                .foregroundColor(layout.titleTextColor)
                        }
                        picker
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
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
                                Spacer()
                                Spacer().frame(width: layout.rightMargin)
                            }
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                picker
                                Spacer()
                                Spacer().frame(width: layout.rightMargin)
                            }
                        case .center:
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                Spacer()
                                if #available(iOS 15.0, *) {
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
                                Spacer()
                                Spacer().frame(width: layout.rightMargin)
                            }
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                Spacer()
                                picker
                                Spacer()
                                Spacer().frame(width: layout.rightMargin)
                            }
                        case .trailing:
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                Spacer()
                                if #available(iOS 15.0, *) {
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
                                Spacer().frame(width: layout.rightMargin)
                            }
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                Spacer()
                                picker
                                Spacer().frame(width: layout.rightMargin)
                            }
                        default:
                            HStack {
                                Spacer().frame(width: layout.leftMargin)
                                if #available(iOS 15.0, *) {
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundStyle(layout.titleTextColor)
                                } else {
                                    Text(verbatim: labelText)
                                        .font(layout.titleTextFont)
                                        .foregroundColor(layout.titleTextColor)
                                }
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
            }
            Spacer().frame(height: layout.bottomMargin)
        })
    }


    private var picker: some View {
#if os(iOS)
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
        .pickerStyle(.segmented)
        .onSubmit(of: .text) {
            onSelected(selectedKey)
        }
#else
        Picker(
            selection: $selectedKey,
            label: layout.alignment == .horizontal ? Text(labelText) : Text(""),
            content: {
                ForEach(items, id: \.key) { key, value in
                    Text(value)
                        .tag(key)
                }
            }
        )
        .pickerStyle(.segmented)
        .onSubmit(of: .text) {
            onSelected(selectedKey)
        }
#endif
    }

}

// MARK: - Layout
extension LabeledSegmentPickerView {

    final public class Layout: BaseLayout {

        // MARK: - Enum

        public enum LabeleAlignment {
            case horizontal
            case vertical
        }

        // MARK: - Properties

        let alignment: LabeleAlignment
        let titleTextFont: Font
        let titleTextColor: Color
        let titleAlignment: HorizontalAlignment
        let segmentSelectedTextColor: XColor
        let segmentSelectedTextFont: XFont
        let segmentNormalTextColor: XColor
        let segmentNormalTextFont: XFont
        let segmentBackgroundColor: Color

        // MARK: - Initializer

        public init(
            alignment: LabeleAlignment = .vertical,
            titleTextFont: Font = LayoutDefault.primaryFont,
            titleTextColor: Color = LayoutDefault.primaryFontColor,
            titleAlignment: HorizontalAlignment = .leading,
            segmentSelectedTextColor: XColor = LayoutDefault.primaryFontUIColor,
            segmentSelectedTextFont: XFont = LayoutDefault.primaryUIFont,
            segmentNormalTextColor: XColor = LayoutDefault.primaryFontUIColor,
            segmentNormalTextFont: XFont = LayoutDefault.primaryUIFont,
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
            self.alignment = alignment
            self.titleTextFont = titleTextFont
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

        public init(
            layout: Layout
        ) {
            self.alignment = layout.alignment
            self.titleTextFont = layout.titleTextFont
            self.titleTextColor = layout.titleTextColor
            self.titleAlignment = layout.titleAlignment
            self.segmentSelectedTextColor = layout.segmentSelectedTextColor
            self.segmentSelectedTextFont = layout.segmentSelectedTextFont
            self.segmentNormalTextColor = layout.segmentNormalTextColor
            self.segmentNormalTextFont = layout.segmentNormalTextFont
            self.segmentBackgroundColor = layout.segmentBackgroundColor
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
        LabeledSegmentPickerView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledSegmentPickerView.Layout(
                alignment: .vertical,
                titleTextColor: .gray,
                titleAlignment: .leading,
                segmentSelectedTextColor: .white,
                segmentBackgroundColor: .blue,
                backgroundColor: .red
            ),
            onSelected: { value in
                print(value)
            }
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
                alignment: .vertical,
                titleTextColor: .gray,
                titleAlignment: .center,
                segmentSelectedTextColor: .white,
                segmentBackgroundColor: .blue,
                backgroundColor: .red
            ),
            onSelected: { value in
                print(value)
            }
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
                alignment: .vertical,
                titleTextColor: .gray,
                titleAlignment: .trailing,
                segmentSelectedTextColor: .white,
                segmentBackgroundColor: .blue,
                backgroundColor: .red
            ),
            onSelected: { value in
                print(value)
            }
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
                alignment: .horizontal,
                titleTextColor: .gray,
                titleAlignment: .center,
                segmentSelectedTextColor: .white, 
                segmentBackgroundColor: .blue,
                backgroundColor: .red
            ),
            onSelected: { value in
                print(value)
            }
        )
    }
#else
    VStack {
        LabeledSegmentPickerView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledSegmentPickerView.Layout(
                alignment: .horizontal,
                titleTextColor: .green,
                titleAlignment: .leading
            ),
            onSelected: { value in
                print(value)
            }
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
                alignment: .vertical,
                titleTextColor: .green,
                titleAlignment: .leading
            ),
            onSelected: { value in
                print(value)
            }
        )
    }
#endif
}
