//
//  HomeViewController.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit
import PanModal

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: HomeInteractorInput?
    var router: HomeRouterProtocol?
    
    var homeData: [HomeModel.HomeData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        interactor?.handlePopularMovie(request: HomeModel.Request.Popular(page: 24))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        HomeConfigurator.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        HomeConfigurator.configure(viewController: self)
    }
    
    func setupTableView() {
        tableView.delegateDataSource(delegate: self, dataSource: self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCell(ofType: HomeTableViewCell.self)
    }
    
    @IBAction func didClickFavoriteButton(_ sender: Any) {
        let favoriteArray: [FavoriteLocalModel] = GreduPreference.structArrayData(FavoriteLocalModel.self, forKey: .favoriteArray)
        print(favoriteArray)
        print(favoriteArray.count)
        
        let vc = FavoriteViewController()
//        vc.favorites = set
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func didClickCategoryButton(_ sender: Any) {
        let vc = CategoryViewController()
        vc.delegate = self
        self.presentPanModal(vc)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cell: HomeTableViewCell.self, indexPath)
        cell.setupView(homeData: self.homeData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.movieId = homeData[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: HomePresenterOutput {
    func showMovieList(viewModel: HomeModel.ViewModel) {
        if let newHomeData = viewModel.homeData {
            self.homeData = newHomeData
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: CategoryDelegate {
    func selectPopular() {
        interactor?.handlePopularMovie(request: HomeModel.Request.Popular(page: 1))
    }
    
    func selectUpcoming() {
        interactor?.handleUpcomingMovie(request: HomeModel.Request.Upcoming(page: 1))
    }
    
    func selectTopRated() {
        interactor?.handleTopRateMovie(request: HomeModel.Request.TopRated(page: 1))
    }
    
    func selectNowPlaying() {
        interactor?.handleNowPlayingMovie(request: HomeModel.Request.NowPlaying(page: 1))
    }
}
