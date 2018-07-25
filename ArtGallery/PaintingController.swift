//
//  PaintingController.swift
//  ArtGallery
//
//  Created by De MicheliStefano on 25.07.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class PaintingController {
    
    func loadPaintingsFromAssets() {
        for index in 1...12 {
            let name = "Image\(index)"
            guard let asset = UIImage(named: name) else { return }
            let painting = Painting(image: asset)
            paintings.append(painting)
        }
    }
    
    func toggleIsLiked(for painting: Painting) {
        painting.isLiked = !painting.isLiked
    }
    
    //MARK: - Properties
    private(set) var paintings: [Painting] = []
    
    init() {
        loadPaintingsFromAssets()
    }
}
