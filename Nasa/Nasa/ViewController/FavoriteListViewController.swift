//
//  FavoriteListViewController.swift
//  Nasa
//
//  Created by Supreem Mishra on 19/09/21.
//

import Foundation
import UIKit

class FavoriteListViewController: UIViewController {
    
    // MARK: -IBOutlets
   @IBOutlet weak var favoriteList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteList.register(UINib.init(nibName: AppConstants.cellIdentifier, bundle: nil), forCellReuseIdentifier: AppConstants.cellIdentifier)
        favoriteList.reloadData()
    }
   
}

// MARK: - Table View Datasource and Delegate methods
extension FavoriteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Helper.singleton.imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.cellIdentifier, for: indexPath) as! ImageListCell
        cell.initialiseData(data: Helper.singleton.imageArray[indexPath.row])
        return cell
    }
}
