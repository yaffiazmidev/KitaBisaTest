//
//  CategoryViewController.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import UIKit
import PanModal

protocol CategoryDelegate {
    func selectPopular()
    func selectUpcoming()
    func selectTopRated()
    func selectNowPlaying()
}

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: CategoryDelegate?
    
    var category: [String] = ["Popular", "Upcoming", "Top Rated", "Now Playing"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegateDataSource(delegate: self, dataSource: self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCell(ofType: UITableViewCell.self)
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cell: UITableViewCell.self, indexPath)
        cell.textLabel?.text = category[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.dismiss(animated: true) {
                self.delegate?.selectPopular()
            }
        case 1:
            self.dismiss(animated: true) {
                self.delegate?.selectUpcoming()
            }
        case 2:
            self.dismiss(animated: true) {
                self.delegate?.selectTopRated()
            }
        case 3:
            self.dismiss(animated: true) {
                self.delegate?.selectNowPlaying()
            }
        default:
            break
        }
    }
}

extension CategoryViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return tableView
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(250.0)
    }
}
