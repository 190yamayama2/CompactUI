//
//  File.swift
//  
//  
//  Created by 190yamayama on 2024/06/12
//  
//

import SwiftUI

/// TabContent
public struct TabContent<Content: View>: Identifiable {

    // MARK: - Properties

    public let id: Int
    public let title: String
    public var content: Content

    // MARK: - Initializer

    public init(
        id: Int,
        title: String,
        content: Content
    ) {
        self.id = id
        self.title = title
        self.content = content
    }
}
