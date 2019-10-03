//
//  MainTableViewCell.swift
//  ImageViewer
//
//  Created by Damon Cricket on 03.10.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit
import Photos

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var countLabel: UILabel?

    func adjust(withAssetCollection assetCollection: PHAssetCollection) {
        nameLabel?.text = assetCollection.localizedTitle
        countLabel?.text = "\(assetCollection.estimatedAssetCount)"
    }
}
