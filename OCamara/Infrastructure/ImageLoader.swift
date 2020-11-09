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

class ImageLoader {
    func load(urlString: String, completion: @escaping ImageLoaderCompletion) {
        if let uiImage = imageCache.object(forKey: urlString as NSString) {
            completion(Image(uiImage: uiImage))
        } else if imageCacheError.contains(urlString) {
            completion(nil)
        } else {
            guard let url: URL = URL(string: urlString) else {
                completion(nil)
                return
            }
            print(url)
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if
                    let data = data,
                    let uiImage: UIImage = UIImage(data: data)
                {
                    imageCache.setObject(uiImage, forKey: urlString as NSString)
                    completion(Image(uiImage: uiImage))
                } else {
                    imageCacheError.append(urlString)
                    completion(nil)
                }
            }.resume()
        }
    }
}
