//
//  DetailViewController.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var realeseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var interactor: DetailInteractorInput?
	var router: DetailRouterProtocol?
    
    var movieId: Int?
    var detailMovie: [DetailModel.ViewModel] = []

	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Title"
        if let id = movieId {
            interactor?.handleMovieDetail(request: DetailModel.Request(movieId: id))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.142642349, green: 0.588091135, blue: 0.9534975886, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        DetailConfigurator.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        DetailConfigurator.configure(viewController: self)
    }
    
    @IBAction func didClictFavoriteButton(_ sender: Any) {
        var favoriteArray: [FavoriteLocalModel] = GreduPreference.structArrayData(FavoriteLocalModel.self, forKey: .favoriteArray)
        if let favorite: FavoriteLocalModel = GreduPreference.structData(FavoriteLocalModel.self, forKey: .favorite) {
            
            favoriteArray.append(favorite)
            GreduPreference.setStructArray(favoriteArray, forKey: .favoriteArray)
            let a: [FavoriteLocalModel] = GreduPreference.structArrayData(FavoriteLocalModel.self, forKey: .favoriteArray)
            print(a)
        }
    }
}

extension DetailViewController: DetailPresenterOutput {
    func showDetailMovieData(viewModel: DetailModel.ViewModel) {
        
        let favoriteModel = FavoriteLocalModel(id: viewModel.id, title: viewModel.title, overview: viewModel.overview, posterPath: viewModel.posterPath, releaseDate: viewModel.releaseDate)
        
        GreduPreference.setStruct(favoriteModel, forKey: .favorite)
        
        if let posterUrl = URL(string: ApiConstants.imageBaseURL + ApiConstants.Image.Resolution.w300 + "\(viewModel.posterPath ?? "")") {
            posterImage.kf.setImage(with: posterUrl)
        }
        self.title = viewModel.title
        titleLabel.text = viewModel.title
        realeseDateLabel.text = "Realese date: \(viewModel.releaseDate?.converDateStringFormat(from: "yyyy-MM-dd", to: "MMM d, yyyy") ?? "-")"
        overviewLabel.text = viewModel.overview
        
    }
    
	// do someting...
}

extension DetailViewController {
	// do someting...
}

struct GreduPreference {
    static func set(value: Any?, forKey key: GreduPreferenceKey) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func getString(forKey key: GreduPreferenceKey) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    static func getDate(forKey key: GreduPreferenceKey) -> Date? {
        return UserDefaults.standard.object(forKey: key.rawValue) as? Date
    }
    
    static func getArray(forKey key: GreduPreferenceKey) -> [Any]? {
        return UserDefaults.standard.array(forKey: key.rawValue)
    }
    
    static func getInt(forKey key: GreduPreferenceKey) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    static func getBool(forKey key: GreduPreferenceKey) -> Bool? {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    static func setStruct<T: Codable>(_ value: T?, forKey key: GreduPreferenceKey) {
        let data = try? JSONEncoder().encode(value)
        set(value: data, forKey: key)
    }
        
    static func setStructArray<T: Codable>(_ value: [T], forKey key: GreduPreferenceKey) {
        let data = value.map { try? JSONEncoder().encode($0) }
        set(value: data, forKey: key)
    }
    
    static func structData<T>(_ type: T.Type, forKey key: GreduPreferenceKey) -> T? where T : Decodable {
        guard let encodedData = UserDefaults.standard.data(forKey: key.rawValue) else {
            return nil
        }
        
        return try! JSONDecoder().decode(type, from: encodedData)
    }
    
    static func structArrayData<T>(_ type: T.Type, forKey key: GreduPreferenceKey) -> [T] where T : Decodable {
        guard let encodedData = UserDefaults.standard.array(forKey: key.rawValue) as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(type, from: $0) }
    }
    
    static func clearSession() {
        set(value: nil, forKey: .favorite)
        set(value: nil, forKey: .favoriteArray)
  }
}

enum GreduPreferenceKey: String {
    case favorite
    case favoriteArray
}
