//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by De MicheliStefano on 25.07.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingTableViewCell: UITableViewCell {
    
    func updateViews() {
        guard let painting = painting else { return }
        imageViews.image = painting.image
        buttonText.currentTitle == "Like"
            ? buttonText.setTitle("Unlike", for: [])
            : buttonText.setTitle("Like", for: [])
    }

    @IBAction func toggleLike(_ sender: Any) {
    }
    
    // MARK: - Properties
    
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var buttonText: UIButton!
    
}
