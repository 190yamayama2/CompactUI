//
//  TabBarView.swift
//  
//  
//  Created by 190yamayama on 2024/06/12
//  
//

import SwiftUI

public struct TabBarView<Content: View>: View {

    // MARK: - Properties

    let tabs: [(id: Int, title: String)]
    @Binding var selection: Int
    private var tabCount: CGFloat {
        CGFloat(tabs.count)
    }

    // MARK: - Layout Property

    let layout: GeneralTabView<Content>.Layout

    // MARK: - Initializer

    public init(
        tabs: [(id: Int, title: String)],
        selection: Binding<Int>,
        layout: GeneralTabView<Content>.Layout
    ) {
        self.tabs = tabs
        self._selection = selection
        self.layout = layout
    }

    // MARK: - View

    public var body: some View {
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
#if os(iOS)
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
#endif
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
