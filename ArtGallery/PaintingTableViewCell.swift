//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by De MicheliStefano on 25.07.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol PaintingTableViewCellDelegate: class {
    func likeButtonWasTapped(on cell: PaintingTableViewCell)
}

class PaintingTableViewCell: UITableViewCell {
    
    func updateViews() {
        guard let painting = painting else { return }
        imageViews.image = painting.image
        
        painting.isLiked == true
            ? buttonText.setTitle("Unlike", for: .normal)
            : buttonText.setTitle("Like", for: .normal)
        
    }

    @IBAction func toggleLike(_ sender: Any) {
        delegate?.likeButtonWasTapped(on: self)
    }
    
    // MARK: - Properties
    
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: PaintingTableViewCellDelegate?
    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var buttonText: UIButton!
    
}
