//
//  AsyncImageViewModel.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/21
//  
//

import SwiftUI

final public class AsyncImageViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set)var downloadData: Data?
    let url: String
    let cachePolicy: URLRequest.CachePolicy

    // MARK: - Initializer

    public init(
        url: String,
        cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad
    ) {
        self.url = url
        self.cachePolicy = cachePolicy
        self.downloadImage(urlString: self.url)
    }

    // MARK: - Private

    private func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let cache = URLCache.shared
        let request = URLRequest(
            url: url,
            cachePolicy: cachePolicy
        )
        if let data = cache.cachedResponse(for: request)?.data {
            self.downloadData = data
        } else {
            Task(priority: TaskPriority.background) {
                let data = try? Data(contentsOf: url)
                Task { @MainActor in
                    self.downloadData = data
                }
            }
        }
    }

}
