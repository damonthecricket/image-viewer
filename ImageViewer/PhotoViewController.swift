//
//  PhotoViewController.swift
//  ImageViewer
//
//  Created by Damon Cricket on 04.10.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit
import Photos

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView?
    
    var asset: PHAsset!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        PHImageManager.default().requestImage(for: asset, targetSize: photoImageView!.bounds.size, contentMode: .aspectFit, options: options) {image, info in
            self.photoImageView?.image = image
        }
    }
}
