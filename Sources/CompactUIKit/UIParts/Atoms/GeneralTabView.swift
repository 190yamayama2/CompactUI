//
//  GeneralTabView.swift
//
//  
//  Created by 190yamayama on 2024/06/03
//  
//

import SwiftUI

/// TabContent
struct TabContent<Content: View>: Identifiable {
    let id: Int
    let title: String
    var content: Content
}

struct TabBarView<Content: View>: View {

    // MARK: - Properties

    let tabs: [(id: Int, title: String)]
    @Binding var selection: Int
    let layout: GeneralTabView<Content>.Layout
    private var tabCount: CGFloat {
        CGFloat(tabs.count)
    }

    // MARK: - Initializer

    init(
        tabs: [(id: Int, title: String)],
        selection: Binding<Int>,
        layout: GeneralTabView<Content>.Layout
    ) {
        self.tabs = tabs
        self._selection = selection
        self.layout = layout
    }

    // MARK: - View

    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width / CGFloat(layout.displayTabCount.rawValue)
            LazyHStack(alignment: .center, spacing: 0) {
                ForEach(tabs, id: \.id) { tab in
                    HStack {
                        Button {
                            selection = tab.id
                        } label: {
                            Text(tab.title)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(
                                    tab.id == selection 
                                        ? layout.selectedTabFontColor
                                        : layout.tabFontColor
                                )
                                .font(
                                    tab.id == selection 
                                        ? layout.selectedTabFont
                                        : layout.tabFont
                                )
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .frame(width: itemWidth, height: layout.tabHeight)
                    .overlay(alignment: .bottomLeading) {
                        if tab.id == selection {
                            Rectangle()
                                .foregroundColor(layout.underLineColor)
                                .frame(
                                    width: itemWidth,
                                    height: layout.underLineWidth
                                )
                                .offset(
                                    x: 0,
                                    y: layout.bottomMargin
                                )
                        }
                    }
                }
            }
            .offset(x: offsetX(displayTabCount: layout.displayTabCount, itemWidth: itemWidth))
            .animation(.default, value: selection)
        }
    }

    public func offsetX(
        displayTabCount: DisplayTabCount,
        itemWidth: CGFloat
    ) -> CGFloat {
        // first
        if selection <= 0 {
            return 0.0
        }
        // last
        if selection == (tabs.count - 1) {
            return -CGFloat(tabs.count - displayTabCount.rawValue) * itemWidth
        }
        // middle
        switch displayTabCount {
            case .two:
                return -CGFloat(CGFloat(selection) * itemWidth)
            case .three:
                return -CGFloat(CGFloat(selection - 1) * itemWidth)
            case .four:
                if selection < displayTabCount.rawValue - 1 {
                    return -CGFloat(CGFloat(selection - 1) * itemWidth)
                } else {
                    return -CGFloat(CGFloat(selection - 2) * itemWidth)
                }
        }
    }

}

struct GeneralTabView<Content: View>: View {

    // MARK: - Properties

    let tabContents: [TabContent<Content>]
    @State var selection: Int
    let layout: Layout
    private var tabCount: CGFloat {
        CGFloat(tabContents.count)
    }

    // MARK: - Initializer

    init(
        tabContents: [TabContent<Content>],
        selection: Int,
        layout: Layout = Layout()
    ) {
        self.tabContents = tabContents
        self.selection = selection
        self.layout = layout
        if tabContents.count < layout.displayTabCount.rawValue {
            fatalError("Insufficient number of tab contents to display.Please set contentsCount and displayTabCount to the correct values.")
        }
    }

    // MARK: - View

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                TabBarView<Content>(
                    tabs: tabContents.map({ (id: $0.id, title: $0.title) }),
                    selection: $selection,
                    layout: layout
                )
                .frame(height: layout.tabHeight)
                TabView(selection: $selection) {
                    ForEach(tabContents) { tabContent in
                        tabContent.content
                            .tag(tabContent.id)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }
    }

}

// MARK: - Layout
extension GeneralTabView {
    final public class Layout: BaseLayout {

        var hasUnderLine: Bool
        var underLineColor: Color
        var underLineWidth: CGFloat
        var displayTabCount: DisplayTabCount
        var tabHeight: CGFloat
        var tabWidth: CGFloat
        var tabFont: Font
        var tabFontColor: Color
        var selectedTabFont: Font
        var selectedTabFontColor: Color

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
            cornerRadius: CGFloat = LayoutDefault.cornerRadius,
            hasUnderLine: Bool = true,
            underLineColor: Color = LayoutDefault.secondaryFontColor,
            underLineWidth: CGFloat = LayoutDefault.borderWidth,
            displayTabCount: DisplayTabCount = LayoutDefault.displayTabCount,
            tabHeight: CGFloat = LayoutDefault.tabHeight,
            tabWidth: CGFloat = LayoutDefault.tabWidth,
            tabFont: Font = LayoutDefault.tabFont,
            tabFontColor: Color = LayoutDefault.tabFontColor,
            selectedTabFont: Font = LayoutDefault.selectedTabFont,
            selectedTabFontColor: Color = LayoutDefault.selectedTabFontColor
        ) {
            self.hasUnderLine = hasBorder
            self.underLineColor = underLineColor
            self.underLineWidth = underLineWidth
            self.displayTabCount = displayTabCount
            self.tabHeight = tabHeight
            self.tabWidth = tabWidth
            self.tabFont = tabFont
            self.tabFontColor = tabFontColor
            self.selectedTabFont = selectedTabFont
            self.selectedTabFontColor = selectedTabFontColor
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
            self.hasUnderLine = layout.hasBorder
            self.underLineColor = layout.underLineColor
            self.underLineWidth = layout.underLineWidth
            self.displayTabCount = layout.displayTabCount
            self.tabHeight = layout.tabHeight
            self.tabWidth = layout.tabWidth
            self.tabFont = layout.tabFont
            self.tabFontColor = layout.tabFontColor
            self.selectedTabFont = layout.selectedTabFont
            self.selectedTabFontColor = layout.selectedTabFontColor
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

private struct PageView: View {
    var text: String
    var body: some View {
        Text(verbatim: text)
    }
}

#Preview {
    VStack {
        GeneralTabView(
            tabContents: [
                TabContent(
                    id: 0,
                    title: "Personal",
                    content: PageView(text: "1st")
                ),
                TabContent(
                    id: 1,
                    title: "Trending",
                    content: PageView(text: "2nd")
                ),
                TabContent(
                    id: 2,
                    title: "Country News",
                    content: PageView(text: "3rd")
                ),
                TabContent(
                    id: 3,
                    title: "World News",
                    content: PageView(text: "4th")
                )
            ],
            selection: 1,
            layout: .init(displayTabCount: .three)
        )
        GeneralTabView(
            tabContents: [
                TabContent(
                    id: 0,
                    title: "Personal",
                    content: PageView(text: "1st")
                ),
                TabContent(
                    id: 1,
                    title: "Trending",
                    content: PageView(text: "2nd")
                ),
                TabContent(
                    id: 2,
                    title: "Country News",
                    content: PageView(text: "3rd")
                ),
                TabContent(
                    id: 3,
                    title: "World News",
                    content: PageView(text: "4th")
                ),
                TabContent(
                    id: 4,
                    title: "Universe News",
                    content: PageView(text: "5th")
                )
            ],
            selection: 3,
            layout: .init(displayTabCount: .four)
        )
    }
}
