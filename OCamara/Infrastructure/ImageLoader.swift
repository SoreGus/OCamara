//
//  ImageLoader.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import SwiftUI

typealias ImageLoaderCompletion = (Image?) -> Void

class ImageLoader {
    static func load(urlString: String, completion: @escaping ImageLoaderCompletion) {
        guard let url: URL = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if
                let data = data,
                let uiImage: UIImage = UIImage(data: data)
            {
                completion(Image(uiImage: uiImage))
            } else {
                completion(nil)
            }
        }.resume()
    }
}
