//
//  FavoriteViewController.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: FavoriteInteractorInput?
	var router: FavoriteRouterProtocol?
    
    var viewModelFavorite: [FavoriteModel.ViewModel] = []

	override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  "Favorite"
        var viewModel: [FavoriteModel.ViewModel] = []
        var viewModelRemoveDuplicate: [FavoriteModel.ViewModel] = []
        
        GreduPreference.structArrayData(FavoriteLocalModel.self, forKey: .favoriteArray).forEach { (favorites) in
            let newViewModel = FavoriteModel.ViewModel(id: favorites.id,
                                                       title: favorites.title,
                                                       overview: favorites.overview,
                                                       posterPath: favorites.posterPath,
                                                       releaseDate: favorites.releaseDate)
            
            viewModel.append(newViewModel)
            viewModelRemoveDuplicate = viewModel.removingDuplicates()
        }
        
        viewModelFavorite = viewModelRemoveDuplicate
        
		setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.142642349, green: 0.588091135, blue: 0.9534975886, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        FavoriteConfigurator.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        FavoriteConfigurator.configure(viewController: self)
    }
    
    func setupTableView() {
        tableView.delegateDataSource(delegate: self, dataSource: self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCell(ofType: HomeTableViewCell.self)
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelFavorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cell: HomeTableViewCell.self, indexPath)
        cell.setupViewFavorite(homeData: self.viewModelFavorite[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.movieId = viewModelFavorite[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FavoriteViewController: FavoritePresenterOutput {
	// do someting...
}

extension FavoriteViewController {
	// do someting...
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
