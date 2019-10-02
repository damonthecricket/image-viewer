//
//  Album.swift
//  ImageViewer
//
//  Created by Damon Cricket on 02.10.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import Foundation
import Photos

func Albums() -> [PHAssetCollection] {
    var albums: [PHAssetCollection] = []
    let options = PHFetchOptions()
    let userAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)
    userAlbums.enumerateObjects { collection, count, isStop in
        albums.append(collection)
    }
    return albums
}
