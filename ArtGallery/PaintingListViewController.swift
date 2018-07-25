//
//  PaintingListViewController.swift
//  ArtGallery
//
//  Created by De MicheliStefano on 25.07.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PaintingTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func likeButtonWasTapped(on cell: PaintingTableViewCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        let painting = paintingController.paintings[index.row]
        paintingController.toggleIsLiked(for: painting)
        tableView.reloadRows(at: [index], with: .none)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingController.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaintingCell", for: indexPath)
        guard let paintingCell = cell as? PaintingTableViewCell else { return cell }
        
        let painting = paintingController.paintings[indexPath.row]
        paintingCell.painting = painting
        paintingCell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return paintingController.paintings[indexPath.row].image.size.height + 100
    }
    
    // MARK: - Properties
    
    let paintingController = PaintingController()
    @IBOutlet weak var tableView: UITableView!
    
}
