//
//  Cell.swift
//  SkeletonSample
//
//  Created by Artur Chabera on 25/05/2019.
//  Copyright © 2019 Artur Chabera. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    @IBOutlet weak var button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = cellImage.frame.width / 2
        cellImage.clipsToBounds = true
    }

    var cellData: CellData? {
        didSet {
            setupCell()
        }
    }

    private func setupCell() {
        guard let cellData = cellData else { return }
        cellImage.image = UIImage(named: "corgi")
        cellTitle.text = cellData.title
        cellSubtitle.text = cellData.subtitle
    }
}
