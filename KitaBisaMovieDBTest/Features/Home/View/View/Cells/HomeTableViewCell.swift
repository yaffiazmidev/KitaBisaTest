//
//  HomeTableViewCell.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var realeseDateLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(homeData: HomeModel.HomeData?) {
        movieTitleLabel.text = homeData?.title
        realeseDateLabel.text = homeData?.releaseDate?.converDateStringFormat(from: "yyyy-MMMM-dd", to: "MMM d, yyyy")
        overViewLabel.text = homeData?.overview
        if let posterImageURLString = homeData?.posterPath {
            guard let posterUrl = URL(string: "\(ApiConstants.imageBaseURL)\(ApiConstants.Image.Resolution.w300)\(posterImageURLString)") else { return }
            posterImage.kf.setImage(with: posterUrl)
        }
    }
    
    func setupViewFavorite(homeData: FavoriteModel.ViewModel?) {
        movieTitleLabel.text = homeData?.title
        realeseDateLabel.text = homeData?.releaseDate?.converDateStringFormat(from: "yyyy-MMMM-dd", to: "MMM d, yyyy")
        overViewLabel.text = homeData?.overview
        if let posterImageURLString = homeData?.posterPath {
            guard let posterUrl = URL(string: "\(ApiConstants.imageBaseURL)\(ApiConstants.Image.Resolution.w300)\(posterImageURLString)") else { return }
            posterImage.kf.setImage(with: posterUrl)
        }
    }
    
}
