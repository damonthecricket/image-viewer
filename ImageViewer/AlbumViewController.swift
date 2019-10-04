//
//  AlbumViewController.swift
//  ImageViewer
//
//  Created by Damon Cricket on 04.10.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit
import Photos

class AlbumViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView?
    
    var album: PHAssetCollection!
    
    var photos: [PHAsset] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = album.localizedTitle
        
        collectionView?.contentInset = UIEdgeInsets(top: -20.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        let collectionResult = PHAsset.fetchAssets(in: album, options: nil)
        collectionResult.enumerateObjects {asset, idx, isStop in
            self.photos.append(asset)
        }
        collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "push.photo" {
            let vc = segue.destination as! PhotoViewController
            let selectedIndexPath = collectionView!.indexPathsForSelectedItems!.first!
            vc.asset = photos[selectedIndexPath.row]
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width/3.0, height: view.bounds.width/3.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo.cell.identifier", for: indexPath) as! PhotoCollectionViewCell
        let asset = photos[indexPath.row]
        cell.adjust(withAsset: asset)
        return cell
    }
}
