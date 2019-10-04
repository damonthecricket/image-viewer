//
//  PhotoCollectionViewCell.swift
//  ImageViewer
//
//  Created by Damon Cricket on 04.10.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit
import Photos

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView?
    
    func adjust(withAsset asset: PHAsset) {
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        PHImageManager.default().requestImage(for: asset, targetSize: photoImageView!.frame.size, contentMode: .aspectFit, options: options) {image, info in
            self.photoImageView?.image = image!
        }
    }
}
