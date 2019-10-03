//
//  MainViewController.swift
//  ImageViewer
//
//  Created by Damon Cricket on 02.10.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit
import Photos

class MainViewController: UITableViewController {

    var albums: [PHAssetCollection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        let options = PHFetchOptions()
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .any, options: options)
        let userAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)
        smartAlbums.enumerateObjects {collection, count, isStop in
            self.albums.append(collection)
        }
        userAlbums.enumerateObjects { collection, count, isStop in
            self.albums.append(collection)
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "album.cell.identifier", for: indexPath) as! MainTableViewCell
        let album = albums[indexPath.row]
        cell.adjust(withAssetCollection: album)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
