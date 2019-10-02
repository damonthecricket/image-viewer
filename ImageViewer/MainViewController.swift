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
        
        albums = Albums()
    }
}
