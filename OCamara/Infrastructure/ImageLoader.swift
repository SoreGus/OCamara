//
//  ImageLoader.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import SwiftUI

typealias ImageLoaderCompletion = (Image?) -> Void

fileprivate let imageCache: NSCache = NSCache<NSString, UIImage>()
fileprivate var imageCacheError: [String] = []

enum ImageLoaderError: Error {
    case cache
    case wrongURL
    case wrongImageFormat
}

class ImageLoader {
    func load(urlString: String) async throws -> Image {
        if let uiImage = imageCache.object(forKey: urlString as NSString) {
            return Image(uiImage: uiImage)
        } else if imageCacheError.contains(urlString) {
            throw ImageLoaderError.cache
        }
        guard let url: URL = URL(string: urlString) else {
            throw ImageLoaderError.wrongURL
        }
        let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
        if let image = UIImage(data: data) {
            imageCache.setObject(image, forKey: urlString as NSString)
            return Image(uiImage: image)
        }
        throw ImageLoaderError.wrongImageFormat
    }
}
